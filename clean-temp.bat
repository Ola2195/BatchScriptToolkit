@echo off
setlocal

:: Ask for confirmation before proceeding
echo WARNING: This script will delete all files from the Recycle Bin and the Downloads folder.
choice /C YN /M "Are you sure you want to proceed? (Y/N)"

if ERRORLEVEL 2 (
    echo Operation cancelled.
    endlocal
    exit /B
)

:: Clear Recycle Bin
rmdir /S /Q %systemdrive%\$Recycle.Bin

:: Clear Downloads folder
del /Q "%userprofile%\Downloads\*"

endlocal

