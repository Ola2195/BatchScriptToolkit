@echo off
setlocal

:: ===============================
:: CONFIGURATION VARIABLES - MODIFY THESE BEFORE RUNNING THE SCRIPT
:: ===============================

:: Interval in seconds between screenshots
set "interval=60"

:: Output directory for screenshots
set "outputDir=%userprofile%\Pictures\Screenshots"

:: ===============================
:: END OF CONFIGURATION VARIABLES
:: ===============================

:: Create output directory if it doesn't exist
if not exist "%outputDir%" mkdir "%outputDir%"

:: Loop to take screenshots at intervals
:loop
set "timestamp=%DATE:~-4,4%-%DATE:~-7,2%-%DATE:~-10,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"
nircmd.exe savescreenshot "%outputDir%\screenshot_%timestamp%.png"
timeout /T %interval% /NOBREAK
goto loop

endlocal