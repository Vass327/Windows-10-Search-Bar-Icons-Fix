@echo off
REM Define the path to the folder.
SET CACHE_DIR=%LOCALAPPDATA%\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\LocalState\AppIconCache\100

ECHO Trying to delete files in "%CACHE_DIR%"...

REM Deletes all files and folders within the specified directory.
REM /Q for silent mode (Quiet)
REM /S to subdirectories
DEL /Q /S "%CACHE_DIR%\*"

REM Check if the command was successful.
IF EXIST "%CACHE_DIR%\*" (
    ECHO It was not possible to delete all files, or the folder does not exist.
) ELSE (
    ECHO All files in the folder were successfully deleted..
)

REM Defines the full path to the key and value to be deleted.
SET REG_PATH=HKEY_CLASSES_ROOT\CLSID\{8AD5CECD-DF0D-41C3-BA21-1E22114CC73C}
SET VALUE_NAME=DisableProcessIsolation

REM Deletes the value from the registry. The /v switch specifies the value name, and /f forces deletion without confirmation.
REG DELETE "%REG_PATH%" /v "%VALUE_NAME%" /f

REM Check if the previous command was successful.
IF %ERRORLEVEL% EQU 0 (
    ECHO Registry key "%VALUE_NAME%" successfully deleted, now Reboot your PC.
) ELSE (
    ECHO An error occurred or the key/value was not found.
)

PAUSE