# BatchScriptToolkit

BatchScriptToolkit is a repository of various batch scripts (`.bat`) and VBScript (`.vbs`) files designed to simplify and automate repetitive tasks in Windows environments. Whether you're managing files, automating backups, or performing routine maintenance, this toolkit has something for you.

## `backup-and-clean.bat`

This batch script automates the process of creating compressed backups of a specified source directory and managing old backup files. It uses Windows built-in tools and PowerShell to perform its tasks.

### Features

- Copies all files from a source directory to a temporary location and compresses them into a ZIP file with a timestamp (formatted as YYYY-MM-DD_HHMMSS).
- Deletes backup files older than a specified number of days to conserve disk space.
- Easily configurable variables for backup location, source directory, and maximum file age.

### Usage

1. **Set Up Directories**: Ensure you have the correct source and backup directories defined in the script.
```batch
:: Directory where backups will be stored
set "backupDir=C:\BackupDirectory"

:: Source directory that will be backed up
set "source=C:\SourceDirectory"
```
2. **Adjust Retention**: Modify the `maxFileAgeDays` variable to change how long backups are retained.
```batch
:: Number of days to keep old backup files before deleting them
set "maxFileAgeDays=7"
```
3. **Run the Script**: You can run the script manually or set it up in the Task Scheduler for automatic execution.

### Additional Notes
- Ensure you have the necessary permissions to read from the source directory and write to the backup directory.
- This script requires PowerShell to compress the backup files. Make sure PowerShell is installed and accessible in your environment.
- To automate this script, you can set up a task in Windows Task Scheduler to run it at desired intervals.

## run-hidden.vbs

A simple VBScript that allows you to run any script or executable file without displaying a Command Prompt window. This script is particularly useful for running batch files or other command-line programs in the background, without showing the terminal window that normally appears.

### Usage

To run a batch file (.bat) or any executable (.exe) without showing a Command Prompt window, open a Command Prompt or PowerShell window and use the following command:

```bash
wscript.exe "C:\Scripts\run-hidden.vbs" "C:\Path\To\YourScript.bat"
```
Replace "C:\Scripts\run-hidden.vbs" with the actual path to your run-hidden.vbs file.
Replace "C:\Path\To\YourScript.bat" with the path to the batch file or executable you want to run silently.

### Additional Notes
- The run-hidden.vbs script supports only one argument, which is the full path to the script or executable you want to run silently.
- Some antivirus programs may flag .vbs scripts as potentially harmful, especially if they execute other scripts or programs silently. Ensure your script and usage are secure and legitimate.
- The script does not include any error handling. If the provided file path is incorrect or the file does not exist, no error message will be shown.
