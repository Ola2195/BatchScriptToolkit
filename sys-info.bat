@echo off
setlocal

:: ===============================
:: CONFIGURATION VARIABLES - MODIFY THESE BEFORE RUNNING THE SCRIPT
:: ===============================

:: Output file
set "outputFile=C:\SystemInfo\system_report.txt"
set "outputFilePowerShell=C:\SystemInfo\system_report_powershell.txt"

:: ===============================
:: END OF CONFIGURATION VARIABLES
:: ===============================

:: Create output directory if it doesn't exist
if not exist "C:\SystemInfo" mkdir "C:\SystemInfo"

:: Generate system information report
systeminfo > "%outputFile%"

:: Generate system information report with PowerShell to output in UTF-8 encoding
powershell -command "Get-ComputerInfo | Out-File -FilePath '%outputFilePowerShell%' -Encoding utf8"

endlocal