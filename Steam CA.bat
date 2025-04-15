@echo off
rem [ SETTINGS ]==========================================================
set AppName=Steam Custom Activity
set AppAuthor=kpuc313
set AppVersion=v2025.03.16
set AppHomePage=https://github.com/kpuc313
set AppExtName=sca
rem ======================================================================

rem [ APPLICATION ]=======================================================
title %AppName%

if not exist "Steam.exe" (
	call :fn_popup "%AppName%" "Please, put the program in the Steam.exe directory!" "Warning"
	exit
)

NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
	set AppAdmin=Administrator:
) else (
	set AppAdmin=
)

if not exist "%~f0.%AppExtName%" (
	type nul > "%~f0.%AppExtName%"
	pause > nul
) else (
	del "%~f0.%AppExtName%"
	taskkill /F /IM %~f0 /T
	taskkill /F /FI "WindowTitle eq  %AppAdmin%  %AppName%" /T
	exit
)
rem ======================================================================

rem [ FUNCTIONS ]==========================================================
:: *** Function PopUP v1.0 - Show notification popup ***
:: Usage: call :fn_popup "Title" "Message" "Icon" "Time to show in seconds (Default: 0-Unlimited[OK button needs to be pressed])"
:: Icon Types: None, Error, Question, Warning, Info
:fn_popup
if "%~1" == "" (set PopupTitle="Default Title") else (set PopupTitle=%1)
if "%~2" == "" (set PopupMessage="Default Message") else (set PopupMessage=%2)
if "%~3" == "" (set PopupIcon=0)
if "%~3" == "None" (set PopupIcon=0)
if "%~3" == "Error" (set PopupIcon=10)
if "%~3" == "Question" (set PopupIcon=20)
if "%~3" == "Warning" (set PopupIcon=30)
if "%~3" == "Info" (set PopupIcon=40)
if "%~4" == "" (set PopupTime=0) else (set PopupTime=%4)
powershell -Command "(New-Object -ComObject Wscript.Shell).Popup('%PopupMessage%', %PopupTime%, '%PopupTitle%', 0x%PopupIcon%)"
exit /B
rem ======================================================================