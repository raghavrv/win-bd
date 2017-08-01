@ECHO OFF

IF "%~1"=="" ( 
    ECHO.
    ECHO bd is used to quickly migrate to a specified directory up in the hierarchy without doing a CD "..\..\"
    ECHO.
    ECHO USAGE
    ECHO =====
    ECHO.
    ECHO For a current directory path of "C:\User\UserA\Projects\ABC\src\java\com\company\proj\other utilities\basic\d\"
    ECHO.
    ECHO To migrate to src                                                          -   bd src
    ECHO To migrate to a directory with spaces in its name like "other utilities"   -   bd "other utilities"
    ECHO.
    ECHO You can also type in just a few characters of the directory name for unique directory names along the hierarchy
    ECHO To migrate to "other utilities"                                            -   bd ot
    ECHO To migrate to Projects                                                     -   bd proje
    ECHO.
    ECHO Always the lowermost directory is chosen in case the first few chars entered matches with two such directories.
    ECHO this is done with the view that the previous command can be repeated to go to the next higher directory
    ECHO.
    ECHO To migrate to Projects                  -   bd proj    -- Changes the directory to ...company\proj\...
    ECHO                                         -   bd proj    -- Changes the directory to ...UserA\Projects\...
    ECHO.

) ELSE (

        SET mypath=%~dp0

        IF EXIST %mypath%bd.class. (

            SETLOCAL ENABLEDELAYEDEXPANSION

            SET BD_SEARCH_STRING="%~1"

            FOR /F "delims=" %%i in ('java -classpath %mypath% bd !BD_SEARCH_STRING!') do (
               
                SET BD_SEARCH_STRING=
                
                ENDLOCAL

                CD %%i

            )


            IF NOT "!BD_SEARCH_STRING!"=="" (

              ECHO.

            ) ELSE (
            
              ECHO "%~1" not found.
              SET BD_SEARCH_STRING=
              ENDLOCAL

            )

           
        ) ELSE (

             ECHO bd cannot work without its helper "bd.class". Download the bd.java file, compile it to bd.class
             ECHO and place the bd.class file in the same folder as the bd.bat file.

        )
)
