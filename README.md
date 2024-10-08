# BatchScriptToolkit

BatchScriptToolkit is a repository of various batch scripts (`.bat`) and VBScript (`.vbs`) files designed to simplify and automate repetitive tasks in Windows environments. Whether you're managing files, automating backups, or performing routine maintenance, this toolkit has something for you.


## Scripts
- [auto-screenshot.bat](#auto-screenshotbat)
- [backup-and-clean.bat](#backup-and-cleanbat)
- [batch-rename.bat](#batch-renamebat)
- [cleanup-script.bat](#cleanup-scriptbat)
- [disk-space-check.bat](#disk-space-checkbat)
- [sys-info.bat](#sys-infobat)
- [run-hidden.vbs](#run-hiddenvbs)


## `auto-screenshot.bat`

This batch script automatically captures screenshots of your desktop at regular intervals, saving them to a specified directory. This can be useful for monitoring, creating time-lapse videos, or keeping a record of on-screen activities.

### Features

- Takes screenshots at user-defined intervals.
- Saves screenshots to a specified folder.
- Saves each screenshot with a unique filename that includes the date and time.

### Usage

1. **Set Configuration Variables**: Before running the script, adjust the configuration variables as needed:

    ```batch
    :: Interval in seconds between screenshots
    set "interval=60"

    :: Output directory for screenshots
    set "outputDir=%userprofile%\Pictures\Screenshots"
    ```

    - **`interval`**: Time in seconds between each screenshot. Modify `60` to your desired interval.
    - **`outputDir`**: Directory where screenshots will be saved. The default is `%userprofile%\Pictures\Screenshots`, but this can be changed to any valid folder path.

2. **Install NirCmd**: This script requires NirCmd, a small command-line utility for Windows. Download NirCmd from [NirSoft](https://www.nirsoft.net/utils/nircmd.html) and ensure `nircmd.exe` is placed in a directory that is included in your system's PATH or in the same directory as the script.

3. **Run the Script**: Execute the script by double-clicking it or running it from a Command Prompt. It will start taking screenshots at the specified intervals.

4. **Stopping the Script**: To stop the script, close the Command Prompt window or press `Ctrl + C` in the Command Prompt.

### Additional Notes

- Ensure you have the necessary permissions to create files in the output directory.
- Running the script with a very short interval (e.g., every second) might impact system performance.
- Make sure `nircmd.exe` is available on your system. The script uses NirCmd to take screenshots, and it must be properly installed or located in the script’s directory.

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

## `batch-rename.bat`

This batch script is designed to rename all files in a specified folder by adding both a prefix and a suffix to each file name. This can be particularly useful for organizing files by date or category.

### Features

- Adds a specified prefix to the beginning of each file name in the target folder.
- Adds a suffix to the end of each file name, before the file extension.
- Uses the current date and time to create a unique suffix for each file.

### Usage

1. **Configure the Script**: Before running the script, set the necessary configuration variables according to your needs:

   ```batch
   :: Folder containing files to rename
   set "targetFolder=C:\Ola\Inne"

   :: Prefix to add to each file
   set "prefix=OLD_"

   :: Suffix to add to each file
   set "suffix=_%DATE:~-4,4%-%DATE:~-7,2%-%DATE:~-10,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"
   ```

   - **`targetFolder`**: The folder where the files to be renamed are located.
   - **`prefix`**: The text you want to add to the beginning of each file name.
   - **`suffix`**: The text you want to add to the end of each file name.

2. **Run the Script**: You can run the script manually or set it up in the Task Scheduler for automatic execution.

### Additional Notes

- If you have important data, make sure to back up your files before running batch rename operations. 
- The script preserves the original file extensions when renaming.

## `cleanup-script.bat`

This batch script is designed to clear the Recycle Bin and the Downloads folder. It prompts the user for confirmation before proceeding to avoid accidental data loss.

### Usage

1. Simply execute the script by double-clicking it or running it from a Command Prompt. You will be prompted to confirm the deletion.
2. The script uses choice to ask for user confirmation. Type `Y` to proceed with the cleanup or `N` to cancel the operation.

### Additional Notes
- Ensure you have the necessary permissions to delete files from the Recycle Bin and the Downloads folder.
- This script performs irreversible actions. Double-check that you want to delete all files in these directories before confirming.

## `disk-space-check.bat`

This batch script checks the free disk space on the C: drive and compares it to a specified threshold. If the free space is below the threshold, it displays a warning message. Otherwise, it indicates that there is sufficient disk space.

### Features

- Retrieves the free space on the C: drive in bytes and converts it to megabytes (MB).
- Compares the free space to a user-defined threshold to determine if disk space is low.
- Provides feedback based on whether the free space meets the threshold criteria.

### Usage

1. **Set Threshold**: Adjust the `threshold` variable to specify the minimum amount of free space (in MB) before a warning is issued.
    ```batch
    :: Set threshold for free space (in MB)
    set "threshold=1000"
    ```
2. **Run the Script**: Execute the script to check disk space. It will display a warning if the free space is below the threshold or confirm that there is sufficient space.

### Additional Notes
- This script requires PowerShell to handle large number calculations. Ensure that PowerShell is available on your system.

Here’s the README entry for your `sys-info.bat` script:

## `sys-info.bat`

This batch script generates a detailed system information report for Windows-based systems. The script creates two reports: one using the `systeminfo` command and another using PowerShell to capture extended system details with UTF-8 encoding.

### Features

- Captures comprehensive system details, including OS version, hardware information, network settings, and more.
- Uses PowerShell to output a system report in UTF-8 encoding, ensuring compatibility with various text editors and preserving special characters.

### Usage

1. **Set Configuration Variables**: Before running the script, you may want to adjust the configuration variables:

    ```batch
    :: Output file paths
    set "outputFile=C:\SystemInfo\system_report.txt"
    set "outputFilePowerShell=C:\SystemInfo\system_report_powershell.txt"
    ```

2. **Run the Script**: Execute the script by double-clicking it or running it from a Command Prompt. It will generate system reports and save them to the specified output directory.

### Additional Notes

- Ensure you have the necessary permissions to create files in the output directory (`C:\SystemInfo` by default). Run the script with administrative privileges if needed.
- If the `C:\SystemInfo` directory does not exist, the script will create it automatically.
- This script requires PowerShell to generate a UTF-8 encoded report. Make sure PowerShell is available on your system.

## `run-hidden.vbs`

A simple VBScript that allows you to run any script or executable file without displaying a Command Prompt window. This script is particularly useful for running batch files or other command-line programs in the background, without showing the terminal window that normally appears.

### Usage

To run a batch file (`.bat`) or any executable (`.exe`) without showing a Command Prompt window, open a Command Prompt or PowerShell window and use the following command:

```bash
wscript.exe "C:\Scripts\run-hidden.vbs" "C:\Path\To\YourScript.bat"
```
- Replace `C:\Scripts\run-hidden.vbs` with the actual path to your `run-hidden.vbs` file.
- Replace `C:\Path\To\YourScript.bat` with the path to the batch file or executable you want to run silently.

### Additional Notes
- The run-hidden.vbs script supports only one argument, which is the full path to the script or executable you want to run silently.
- Some antivirus programs may flag .vbs scripts as potentially harmful, especially if they execute other scripts or programs silently. Ensure your script and usage are secure and legitimate.
- The script does not include any error handling. If the provided file path is incorrect or the file does not exist, no error message will be shown.