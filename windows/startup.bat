@echo off

subst w: C:\Users\krmoh\dev

cd "%USERPROFILE%"
pushd "%USERPROFILE%\Downloads\" 

REM `start`: starts a process asynchronously.
REM first parameter is the window title. since we want to run a script,
REM we kept it empty.
REM `/min` means start minimized.
start "kmonad-custom-remap" /min kmonad.exe  us_ansi_tkl.kbd


REM Wait a bit for Explorer, tray, and monitors to initialize
timeout /t 3 /nobreak >nul
start "glazewm-startup" "C:\Program Files\glzr.io\GlazeWM\glazewm.exe"

popd



