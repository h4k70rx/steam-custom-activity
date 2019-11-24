@echo off
rem [ SETTINGS ]==========================================================
set AppName=Steam Custom Activity
set AppAuthor=kpuc313
set AppVersion=v1.1
set AppHomePage=https://github.com/kpuc313
set AppExtName=sca
rem ======================================================================

rem [ APPLICATION ]=======================================================
title %AppName%

if not exist "Steam.exe" (
	(
		echo [ERROR]: Cannot find Steam.exe!
		echo [ERROR]: Please, put the program in the Steam.exe directory!
		echo.
		echo *** YOU CAN DELETE THIS FILE! ***
	) > "%~f0 ERROR.txt"
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