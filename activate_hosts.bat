@echo off
echo Checking for administrative privileges...

:: Check for admin rights by trying to access a restricted area
NET SESSION >nul 2>&1

if %errorLevel% == 0 (
    echo Administrative permissions confirmed.
    echo Running safe PowerShell command...
    
    :: Execute your legitimate PowerShell command here
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Get-Service | Select-Object Status, Name | Select -First 5"
    
    pause
) else (
    echo Current permissions inadequate. Requesting elevation...
    
    :: Relaunch the script with elevated privileges
    powershell.exe -Command "Start-Process '%~dpnx0' -Verb RunAs"
)