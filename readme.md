# hxIni #

## 1. Introduction ##
hxIni is a fast, light and simple library to read and write INI files, using hashes.

<div align="center">
![](documentation/icon.png)
<div align="left">

Checkout [wikipedia](http://en.wikipedia.org/wiki/INI_file) for more information about **INI Files**.

## 2. Install ##
Use ***haxelib*** to install the release version of the library (if avaliable):

	> haxelib install hxIni

Otherwise, you can download this repository as a zip from *GitLab* (you can try [this link](https://gitlab.com/wikiti/hxini/repository/archive.zip)), and use the local installer from ***haxelib***:

    > haxelib local hxini-23e2b4(...).zip

Also, don't forget to add 

    <haxelib name="hxIni" />

to your **xml** project file, or, for a standard *Haxe* project, add 

    -l hxini

in your **hxml** build file.

## 3. Usage ##

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

    var ini: Ini = IniManager.LoadFromFile("example.ini");

And, the access to parameters it's pretty simple. Imagine a *map* of *maps*, so a section if linked to a *map* of parameters, and you can access like this:

    var name = ini["owner"]["name"];

Also, don't forget to **import** the classes!

    import hxIni.IniManager;
    import hxIni.IniManager.Ini;

## 4. Rules ##
1. **Comments** will be **ignored**.
2. Every **parameter** must belong to at least **one section**.
3. If a **parameter** with an **used name** is found on the same section, it will be **replaced**.
4. If no section is declared, the **Global** section will be used by default (**IniManager.GLOBAL_SECTION**).
5. If a **white line** (not comment) is found, then the following parameters, unless a section is declared, will belong to the **Global section**.
6. **UTF-8** is usable, but not recommend.
7. You can use **[Escaped characters](http://en.wikipedia.org/wiki/INI_file#Escape_characters)**.
8. Parameters **keys** and **values** are **case sensitive**.
9. ...

## 5. Authors ##

This project has been made by:

| Avatar  | Name          | Nickname  | Email              |
| ------- | ------------- | --------- | ------------------ |
| ![](http://i59.tinypic.com/fasosx.jpg)  | Daniel Herzog | Wikiti | [wikiti.doghound@gmail.com](mailto:wikiti.doghound@gmail.com)

## 6. Links ##

- GitLab: [https://gitlab.com/wikiti/hxini](https://gitlab.com/wikiti/hxini)
- Wikipedia: [http://en.wikipedia.org/wiki/INI_file](http://en.wikipedia.org/wiki/INI_file)
- INI Parsing: [http://stackoverflow.com/questions/3870019/javascript-parser-for-a-string-which-contains-ini-data](http://stackoverflow.com/questions/3870019/javascript-parser-for-a-string-which-contains-ini-data)