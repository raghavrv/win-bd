######bd

Jump to a specific directory up in the hierarchy without doing a `cd ..\..\..` repeatedly by directly specifying in full ( or part ) the directory name.

######USAGE

For a current directory path :

**`C:\User\UserA\Projects\ABC\src\java\com\company\proj\other utilities\basic\d\`**<br><br>
<pre>
To migrate to `src`                                       -   `bd src`
To migrate to a directory with spaces in its 
name like `"other utilities"`                             -   `bd "other utilities"`
</pre>
You can also type in just a few characters of the directory name for unique directory names along the hierarchy
<pre>
To migrate to `"other utilities"`                         -   `bd ot`
To migrate to `Projects`                                  -   `bd proje`<br><br>
</pre>
Always the lowermost directory is chosen in case the first few chars entered matches with two such directories. This is done with the view that the previous command can be repeated to go to the next higher directory<br>
<br>
To migrate to `Projects` alternatively you could do `bd proj` twice ( instead of `bd proje` once ):
<pre>
      > `bd proj`    -- Changes the directory to ...company\proj\...<br>
      > `bd proj`    -- Changes the directory to ...UserA\Projects\...<br>
                                          
</pre>                        

######Installation

* Run `javac` to compile the helper `bd.java` to `bd.class`
```
javac bd.java
```

* Put the java class file in the same directory as bd.bat
```
    bd-\
       |- bd.class
       |- bd.bat
```

* Make sure to include the directory in which the `bd.bat` and `bd.class` file resides, to the `PATH` environment variable permenently.
```
setx PATH "%PATH%;C:\Path\To\bd\" /M
```
<br>
######Inspiration

This batch/java version is inspired by [@vigneshwaranr](https://github.com/vigneshwaranr)'s [bd for bash](https://github.com/vigneshwaranr/bd)
