@echo off
setlocal

:: ===============================
:: CONFIGURATION VARIABLES - MODIFY THESE BEFORE RUNNING THE SCRIPT
:: ===============================

:: Directory where backups will be stored
set "backupDir=C:\BackupDirectory"

:: Source directory that will be backed up
set "source=C:\SourceDirectory"

:: Number of days to keep old backup files before deleting them
set "maxFileAgeDays=7"

:: ===============================
:: END OF CONFIGURATION VARIABLES
:: ===============================

:: Other variables
set "tempDir=%backupDir%\temp"
set "dateStamp=%DATE:~-4,4%-%DATE:~-7,2%-%DATE:~-10,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"
set "zipFile=%backupDir%\Backup_%dateStamp%.zip"

:: Create the temporary directory if it doesn't exist
if not exist "%tempDir%" mkdir "%tempDir%"

:: Copy all files from the source directory to the temporary directory
robocopy "%source%" "%tempDir%" /MIR

:: Compress the temporary directory into a ZIP file
powershell -command "Compress-Archive -Path '%tempDir%' -DestinationPath '%zipFile%'"

:: Delete the temporary directory after compression
rmdir /S /Q "%tempDir%"


:: Delete old backup files that are older than the specified number of days
forfiles /P "%backupDir%" /M *.tar.gz /D -%maxFileAgeDays% /C "cmd /C del @path"

endlocal