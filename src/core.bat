REM =============================
REM WRN Cleaner v.1.0.0
REM By Waren Gonzaga
REM =============================

cls
@echo off

REM | Setup Variables
set appname=WRN
set appvers=v1.0.0 (Beta)
set dev=Waren Gonzaga
set desc=An Open Source Best PC Cleaner
set uicolor=a
set cliN=$%appname%Cleaner
set divider==========================
title %appname% PC Cleaner %appvers%

REM | Checking Admin Previlege
for /f "tokens=1,2*" %%V in ('bcdedit') do set admincheck=%%V
if (%admincheck%)==(Access) goto notAdmin

REM | After checking go to main menu
goto mainMenu

REM | Not Admin Error Message
:notAdmin
cls
@echo off
color c
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo # Current user permissions to execute this .bat file are inadequate.
echo # This .bat file must be run with administrative privileges.
echo # Close this program and run it as administrator.
echo # Contact the developer to assist you...
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
pause >nul
goto mainMenu

REM =============================
REM Main Menu
REM =============================
:mainMenu
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo # %desc%
echo # Available commands "auto" and "manual"!
echo # Type "auto" to initiate auto operation.
echo # Type "manual" to enter manual mode.
echo # Type "dev" to enter dev/debug mode.
echo #
set/p "mainMenu=# %cliN%> "
if %mainMenu%==auto goto auto
if %mainMenu%==manual goto mnlModeMenu
if %mainMenu%==dev goto devModeMenu
goto errMes01

REM =============================
REM Automatic Functions
REM =============================
:auto
cls
echo # Checking files...
echo # %divider%
echo # Running...
timeout /t 3 /nobreak> null
tree
timeout /t 3 /nobreak> null
goto aDefrag

REM Automatic Defragment Function
:aDefrag
cls
echo # Auto Cleaning... [Defragment]
echo # %divider%
echo # Running...
echo #
defrag /C /U /V
pause>null
timeout /t 3 /nobreak> null
goto aDiskClean

REM Automatic DiskClean Function
:aDiskClean
cls
echo # Auto Cleaning... [Disk Cleanup]
echo # %divider%
echo # Running...
echo #
cleanmgr /d%driveClean%
timeout /t 3 /nobreak> null
goto aRecyleBin

REM Automatic Empty Recyle Bin
:aRecyleBin
cls
echo # Auto Cleaning... [Recycle Bin]
echo # %divider%
echo # Running...
echo #
echo y | rd /s %systemdrive%\$Recycle.bin
timeout /t 3 /nobreak> null
goto aTempClean

REM Automatic Empty Temp Function
:aTempClean
cls
echo # Auto Cleaning... [Temp Folder]
echo # %divider%
echo # Running...
echo #
del %temp%\*.*/s/q
@ping 127.0.0.1 -n 2 -w 100 > nul
@ping 127.0.0.1 -n %1% -w 100 > nul
timeout /t 3 /nobreak> null
goto aPrefetch

REM Automatic Empty Prefetch Function
:aPrefetch
cls
echo # Auto Cleaning... [Prefetch Folder]
echo # %divider%
echo # Running...
echo # 
del C:\Windows\prefetch\*.*/s/q
@ping 127.0.0.1 -n 2 -w 100 > nul
@ping 127.0.0.1 -n %1% -w 100 > nul
timeout /t 3 /nobreak> null
goto aWindowsLogs

REM Automatic Cleaing the Windows Logs
:aWindowsLogs
cls
echo # Auto Cleaning... [Windows Logs]
echo # %divider%
echo # Running...
echo #
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :aWindowsLogs_cleaner "%%G")
goto doneCleaning

REM Cleaner of Windows Logs
:aWindowsLogs_cleaner
echo clearing %1
wevtutil.exe cl %1
goto :eof
goto doneCleaning

REM Successful Cleaning Screen
:doneCleaning
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # Done Auto Cleaning...
timeout /t 5 /nobreak> null
goto mainMenu

REM =============================
REM Exit Option Function
REM =============================
:exitProgram
exit