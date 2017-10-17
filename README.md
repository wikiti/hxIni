[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md) [![Haxelib Version](https://img.shields.io/github/tag/wikiti/hxIni.svg?style=flat&label=haxelib)](http://lib.haxe.org/p/hxIni/)  [![CircleCI](https://circleci.com/gh/wikiti/hxIni.svg?style=shield)](https://circleci.com/gh/wikiti/hxIni)

# hxIni

## Introduction
hxIni is a fast, light and simple library to read and write INI files, using hashes.

<div align="center">
  <img src="https://raw.githubusercontent.com/wikiti/hxIni/master/doc/icon.png" />
</div>

Checkout [wikipedia](http://en.wikipedia.org/wiki/INI_file) for more information about **INI Files**.

## Install
Use ***haxelib*** to install the release version of the library (if avaliable):

	> haxelib install hxIni

Otherwise, you can download this repository as a zip from *GitHub* (you can try [this link](https://github.com/wikiti/hxIni/archive/master.zip)), and use the local installer from ***haxelib***:

    > haxelib local hxIni-master.zip

Also, don't forget to add

    <haxelib name="hxIni" />

to your **xml** project file, or, for a standard *Haxe* project, add

    -l hxini

in your **hxml** build file.

## Usage

Let's explain this with an example. Imagine you have this **example.ini** file:

	; - example.ini
    ; last modified 1 April 2001 by John Doe
    [owner]
    name=John Doe
    organization=Acme Widgets Inc.

    [database]
    ; use IP address in case network name resolution is not working
    server=192.0.2.62
    port=143
    file="payroll.dat"

There we have two sections (*owner* and *database*), and each one has its own parameters ([*name*, *organization*] and [*server*, *port*, *file*]).

Now, to parse this with hxIni, we must create an **Ini** object with **IniManager** class:

    var ini: Ini = IniManager.loadFromFile("example.ini");

Or, if you have that stored in a **String**, you can use:

    var ini: Ini = IniManager.loadFromString(str_data);

And, the access to parameters it's pretty simple. Imagine a *map* of *maps*, so a section if linked to a *map* of parameters, and you can access like this:

    var name = ini["owner"]["name"];

Finally, you can transform them to a string (after modifications), or save it to a file:

    IniManager.writeToFile(ini, "test.ini");
    trace( IniManager.toString(ini) );

Also, don't forget to **import** the classes!

    import hxIni.IniManager;
    import hxIni.IniManager.Ini;

## Parse rules
1. **Comments** (lines starting with `;`) and **white lines** will be **ignored**.
2. Every **parameter** must belong to at least **one section**.
3. If a **parameter** with an **used name** is found on the same section, it will be **replaced**.
4. If no section is declared, the **Global** section will be used by default (**IniManager.GLOBAL_SECTION**).
5. **UTF-8** is usable, but not recommend.
6. You can use **[Escaped characters](http://en.wikipedia.org/wiki/INI_file#Escape_characters)**.
7. Parameters **keys** and **values** are **case sensitive**.

## Development

Clone the repository:

```shell
$ git clone https://github.com/wikiti/hxini
```

Then, setup the development directory:

```shell
$ haxelib dev hxini hxini
```

To run tests use [munit](https://github.com/massiveinteractive/MassiveUnit):

```shell
$ haxelib install munit
$ haxelib run munit test
```

## Contributors

The following people have helped to develop this library:

| Avatar  | Name          | Nickname  | Contact              |
| ------- | ------------- | --------- | ------------------ |
| ![](https://gravatar.com/avatar/2ae6d81e0605177ba9e17b19f54e6b6c?s=64)  | Daniel Herzog | Wikiti | [wikiti.doghound@gmail.com](mailto:wikiti.doghound@gmail.com)
| ![](https://avatars1.githubusercontent.com/u/90930?s=64)  | Thomas ten Cate | ttencate | [GitHub Profile](https://github.com/ttencate)

## Links

- HaxeLib: [http://lib.haxe.org/p/hxIni](http://lib.haxe.org/p/hxIni)
- Wikipedia: [http://en.wikipedia.org/wiki/INI_file](http://en.wikipedia.org/wiki/INI_file)
- INI Parsing: [http://stackoverflow.com/questions/3870019/javascript-parser-for-a-string-which-contains-ini-data](http://stackoverflow.com/questions/3870019/javascript-parser-for-a-string-which-contains-ini-data)
