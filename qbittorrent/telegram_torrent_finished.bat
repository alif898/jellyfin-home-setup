@echo off
setlocal

:: Get the current script's directory
set "BASEDIR=%~dp0"

:: Remove trailing backslash
if "%BASEDIR:~-1%"=="\" set "BASEDIR=%BASEDIR:~0,-1%"

:: Set the path to the parent directory
for %%I in ("%BASEDIR%\..") do set "PARENTDIR=%%~fI"

:: Path to .env file
set "ENVFILE=%PARENTDIR%\.env"

:: Check if .env exists
if not exist "%ENVFILE%" (
    echo [ERROR] .env file not found at: %ENVFILE%
    goto :EOF
)

:: Load variables from .env file
for /f "usebackq tokens=1,2 delims==" %%a in ("%ENVFILE%") do (
    set "%%a=%%b"
)

:: Arguments from qBittorrent
set "TORRENT_NAME=%~1"
set "CATEGORY=%~2"
set "TORRENT_SIZE_BYTES=%~3"
set "CURRENT_TRACKER=%~4"

set "TORRENT_SIZE=Unknown"
set "SIZE_UNIT="

:: Convert size from bytes to GB using PowerShell (2 decimal places)
for /f %%a in ('powershell -nologo -command "[math]::Round(%TORRENT_SIZE_BYTES% / 1GB, 2)"') do (
    set "TORRENT_SIZE=%%a"
    set "SIZE_UNIT=GB"
)

:: Build message
setlocal enabledelayedexpansion
set "MESSAGE=%%0A<b>qBittorrent: Download Completed</b> %%0AName: !TORRENT_NAME! %%0ACategory: !CATEGORY! %%0ASize: !TORRENT_SIZE! !SIZE_UNIT! %%0ATracker: !CURRENT_TRACKER!"
endlocal & set "MESSAGE=%MESSAGE%"

:: Send message silently
curl -s -X POST ^
    -d "chat_id=%TELEGRAM_CHAT_ID%" ^
    -d "text=%MESSAGE%" ^
    -d "parse_mode=HTML" ^
    "https://api.telegram.org/bot%TELEGRAM_BOT_TOKEN%/sendMessage" >nul 2>&1

endlocal
