:: 1. Tworzenie kopii zapasowej folderu
:: 2. Kopiowanie tylko zmienionych plików
:: 3. Kompresja folderu do pliku ZIP
:: 4. Usuwanie kopii zapasowych starszych niż tydzień 

@echo off
setlocal

:: Zmienne
set "backupDir=C:\BackupDirectory"
set "tempDir=%backupDir%\temp"
set "source=C:\SourceDirectory"
set "dateStamp=%DATE:~-4,4%-%DATE:~-7,2%-%DATE:~-10,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"
set "zipFile=%backupDir%\Backup_%dateStamp%.zip"

:: Tworzenie katalogu tymczasowego
if not exist "%tempDir%" mkdir "%tempDir%"

:: Kopiowanie zmienionych plików do katalogu tymczasowego
robocopy "%source%" "%tempDir%" /MIR

:: Kompresowanie folderu tymczasowego do pliku ZIP
powershell -command "Compress-Archive -Path '%tempDir%' -DestinationPath '%zipFile%'"

:: Usuwanie katalogu tymczasowego
rmdir /S /Q "%tempDir%"

:: Usuwanie starych archiwum kopii zapasowej
forfiles /P "%backupDir%" /M *.tar.gz /D -7 /C "cmd /C del @path"

endlocal