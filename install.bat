DO (
@ECHO OFF
CLS
ECHO  _     _                
ECHO | |__ | | ___   ___ ___ 
ECHO | '_ \| |/ _ \ / __/ __|
ECHO | |_) | | (_) | (_| (__ 
ECHO |_.__/|_|\___/ \___\___|
ECHO.

WHERE tar>nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
  ECHO tar command not found, please install tar to continue...
  EXIT /B
)

WHERE curl>nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
  ECHO curl command not found, please install curl to continue...
  EXIT /B
)

SETLOCAL ENABLEDELAYEDEXPANSION
SET manifest=https://api.github.com/repos/stacc/blocc-cli-releases/releases/latest
FOR /F "tokens=* USEBACKQ" %%F IN (`curl -LSs %manifest%^|findstr /r "\"tag_name\": \"v[0-9]+\.[0-9]+\.[0-9]+\""`) DO (
  SET temp=%%F
)

IF %ERRORLEVEL% NEQ 0 (
  ECHO An error has occurred when trying to curl the github repository
  EXIT /B
)

SET VERSION=%temp:~14,-2%
SET URL=https://github.com/stacc/blocc-cli-releases/releases/download/v%VERSION%/blocc_%VERSION%_Windows_x86_64.tar.gz

ECHO - Downloading and extracting file from %URL%
MKDIR %APPDATA%\blocc
curl -LSs %URL%|tar -C %APPDATA%\blocc --exclude=README.md -xzf -

IF %ERRORLEVEL% NEQ 0 (
  ECHO An error has occurred when trying to download and extract the .tar.gz file
  EXIT /B
)

ECHO - Installing executable to %TARGET%
SET np=%APPDATA%\blocc
ECHO %PATH%|find /i "%np%">nul||SETX path "%PATH%;%np%"

ENDLOCAL
ECHO %PATH%|find /i "%APPDATA%\blocc">nul||SET PATH=%PATH%;%APPDATA%\blocc

ECHO.
ECHO blocc CLI has been successfully installed!

EXIT /B
)