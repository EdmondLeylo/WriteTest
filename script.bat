@echo off
setlocal enableextensions enabledelayedexpansion

set inputfile=file.txt

set tempfile=%random%-%random%.tmp

copy /y nul %tempfile%

set line=0

for /f "delims=" %%l in (%inputfile%) do (
    set /a line+=1
    if !line!==4 (
        echo WORDS YOU REPLACE IT WITH>>%tempfile%
    ) else (
        echo %%l>>%tempfile%
    )
)

del %inputfile%
ren %tempfile% %inputfile%

endlocal