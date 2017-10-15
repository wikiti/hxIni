package;

import massive.munit.Assert;
import hxIni.IniManager;
import hxIni.IniManager.Ini;
import sys.io.File;
import sys.FileSystem;

class IniManagerTest {
  @Test
	public function testFromString() {
    var ini = IniManager.loadFromString(File.getContent('test/example1.ini'));

    // Should equal this:
    var expected: Map<String, Map<String, String>> = [
      "Global" => [ "field" => "A global field", "another" => "Another global field" ],
      "owner" => [ "name" => "John Doe", "organization" => "Acme Widgets Inc." ],
      "database" => [ "file" => "\"payroll.dat\"", "server" => "192.0.2.62", "port" => "143" ]
    ];

    Assert.isNotNull(ini);
    Assert.isTrue(compareMaps(ini, expected));
	}

  @Test
	public function testFromFile() {
    var ini = IniManager.loadFromFile('test/example1.ini');

    // Should equal this:
    var expected: Map<String, Map<String, String>> = [
      "Global" => [ "field" => "A global field", "another" => "Another global field" ],
      "owner" => [ "name" => "John Doe", "organization" => "Acme Widgets Inc." ],
      "database" => [ "file" => "\"payroll.dat\"", "server" => "192.0.2.62", "port" => "143" ]
    ];

    Assert.isNotNull(ini);
    Assert.isTrue(compareMaps(ini, expected));
	}

  @Test
  public function testToString() {
    var string = "[section]\ntest=Another test field";
    var ini = IniManager.loadFromString(string);

    Assert.isNotNull(ini);
    Assert.areEqual(IniManager.toString(ini), string);
  }

  @Test
  public function testWriteToFile() {
    var string = "[section]\ntest=Another test field";
    var ini = IniManager.loadFromString(string);
    var tempFile = "./test/temp.ini";

    IniManager.writeToFile(ini, tempFile);

    Assert.areEqual(File.getContent(tempFile), string);
  }

  private function compareMaps(a: Ini, b: Ini) {
    if(Lambda.count(a) != Lambda.count(b))
      return false;

    for(aKey in a.keys()) {
      var aValue = a[aKey];
      var bValue = b[aKey];

      if(aValue == null || bValue == null || Lambda.count(aValue) != Lambda.count(bValue))
        return false;

      for(aSubKey in aValue.keys()) {
        var aSubValue = aValue[aSubKey];
        var bSubValue = bValue[aSubKey];

        if(aSubValue != bSubValue)
          return false;
      }
    }

    return true;
  }
}
