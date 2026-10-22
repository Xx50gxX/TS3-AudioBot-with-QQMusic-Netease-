@echo off
chcp 65001 >nul
setlocal
set "PSModulePath=%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules;%ProgramFiles%\WindowsPowerShell\Modules"
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\manage-musicbot.ps1" -Action Status
set "taskCode=%errorlevel%"
pause
exit /b %taskCode%
