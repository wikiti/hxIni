package hxIni;

import sys.io.File;
import sys.FileSystem;

/**
 * INI section (like [Program] or [Settings]). Used to organize variables. An Ini object is composed by IniSections
 */
typedef IniSection = Map<String, String>;

/**
 * A Composition of IniSection. The main object of this library, and it's used to represent the INI data.
 */
typedef Ini = Map< String, IniSection >;

/**
 * Primary INI manager class. Used for reading and writing INI files.
 * For data format, checkout http://en.wikipedia.org/wiki/INI_file
 * @author Wikiti
 */
class INIManager
{
  /**
   * Global section name ("Global").
   */
  public static inline var GLOBAL_SECTION: String = "Global";
  
  private function new() { }
  
  /**
   * Read INI data from file.
   * 
   * @param file File to be readed.
   * @return An Ini object if reading and parsing work. "null" will be returned if the reading fails.
   */
  static public function LoadFromFile(file: String): Ini {
    if (!FileSystem.exists(file))
      return null;
    
    return LoadFromString( File.getContent(file) );
  }
  
  /**
   * Read INI data from string.
   * @param data String to be loaded.
   * @return An Ini object if reading and parsing work. An empty object will be returned if the string is empty.
   */
  static public function LoadFromString(data: String): Ini {
    // http://stackoverflow.com/questions/3870019/javascript-parser-for-a-string-which-contains-ini-data
    
    // Expresiones regulares
    var regexp = {
      section: ~/^\s*\[\s*([^\]]*)\s*\]\s*$/,
      param: ~/^\s*([\w\.\-_]+)\s*=\s*(.*?)\s*$/,
      comment: ~/^\s*;.*$/
    };
    
    var ini: Ini = new Ini();
    ini[GLOBAL_SECTION] = new IniSection();
    
    var splitter = ~/\r\n|\r|\n/g;
    var lines = splitter.split(data);
    var section: String = GLOBAL_SECTION;
    
    // Parseo
    for (line in lines) {
      // Comment
      if (regexp.comment.match(line))
        continue;
        
      // Parameter (variable)
      else if (regexp.param.match(line)) {
        ini[section][ regexp.param.matched(1) ] = regexp.param.matched(2);
      }
      
      // Section (new)
      else if (regexp.section.match(line)) {
        // Crear sección si NO existe
        section = regexp.section.matched(1);
        if (ini[section] == null)
          ini[section] = new IniSection();
      }
    }
    
    return ini;
  }
  
}