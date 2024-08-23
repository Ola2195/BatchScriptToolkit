@echo off
setlocal

:: ===============================
:: CONFIGURATION VARIABLES - MODIFY THESE BEFORE RUNNING THE SCRIPT
:: ===============================

:: Set threshold for free space (in MB)
set "threshold=1000"

:: ===============================
:: END OF CONFIGURATION VARIABLES
:: ===============================

:: Get free space on C: drive in bytes
for /F "tokens=3 delims= " %%A in ('dir /-C C:\ ^| findstr /R /C:"bytes free"') do set freeSpaceBytes=%%A

:: Remove commas from free space
set freeSpaceBytes=%freeSpaceBytes:,=%

:: Convert bytes to MB using PowerShell to handle large numbers
for /F %%A in ('powershell -command "([math]::Round(%freeSpaceBytes% / 1MB))"') do set freeSpaceMB=%%A

:: Check if free space is below the threshold
if %freeSpaceMB% LSS %threshold% (
    echo WARNING: Low disk space on C:! Only %freeSpaceMB% MB free.
) else (
    echo Disk space is sufficient: %freeSpaceMB% MB free.
)

endlocal