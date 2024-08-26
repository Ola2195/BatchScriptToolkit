@echo off
setlocal


:: ===============================
:: CONFIGURATION VARIABLES - MODIFY THESE BEFORE RUNNING THE SCRIPT
:: ===============================

:: Folder containing files to rename
set "targetFolder=C:\Ola\Inne"

:: Prefix to add to each file
set "prefix=OLD_"

:: Suffix to add to each file
set "suffix=_%DATE:~-4,4%-%DATE:~-7,2%-%DATE:~-10,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"

:: ===============================
:: END OF CONFIGURATION VARIABLES
:: ===============================

:: Rename files
:: ~nf - returns the filename without extension
:: ~xf - returns file extension without name
for %%f in ("%targetFolder%\*") do (
    rename "%%f" "%prefix%%%~nf%suffix%%%~xf"
)

echo Files renamed successfully.
endlocal
