REM =============================
REM WRN Cleaner v.1.0.0
REM By Waren Gonzaga
REM =============================

REM =============================
REM Variables of the batch script
REM =============================
cls
@echo off
set appname=WRN
set appvers=v1.0.0 (Beta)
set dev=Waren Gonzaga
set desc=An Open Source Best PC Cleaner
set uicolor=a
set cliN=$%appname%Cleaner
set divider==========================
title %appname% PC Cleaner %appvers%

REM Checking Admin Previlege
for /f "tokens=1,2*" %%V in ('bcdedit') do set admincheck=%%V
if (%admincheck%)==(Access) goto noAdmin

goto mainMenu

REM Notice for Admin Previlege
:noAdmin
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
@ping 127.0.0.1 -n %1% -w 100> nul
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
@ping 127.0.0.1 -n %1% -w 100> nul
timeout /t 3 /nobreak> null
goto aWindowsLogs

REM Automatic Cleaing the Windows Logs
:aWindowsLogs
cls
echo # Auto Cleaning... [Windows Logs]
echo # %divider%
echo # Running...
echo #
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
goto doneCleaning

:aWindowsLogs_cleaning
echo clearing %1
wevtutil.exe cl %1
goto :eof
goto doneCleaning

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
REM Manual Functions
REM =============================
:mnlModeMenu
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo # %desc%
echo #
echo # 1 ........ [Disk Defragmenter]
echo # 2 ........ [Disk Cleanup]
echo # 3 ........ [Fix Windows Error]
echo #
set/p "mnlmodeMenu=# %cliN%> "
if %mnlmodeMenu%==1 goto mnlDef
if %mnlmodeMenu%==2 goto mnlDCleanUp
if %mnlmodeMenu%==3 goto mnlFxWnErr
pause>null
goto mainMenu

REM Manual Defragment Function
:mnlDef
echo #
echo # %divider%%divider%
echo #
echo # Manual Cleaning... [Defragment]
echo # Please choose drive LETTER to defrag manually...
echo # Press any key or type "back" or "cancel" to go to previous options / menu
fsutil fsinfo drives
set/p "driveDef=# %cliN%> "
if exist %driveDef%:/ (
    defrag %driveDef%: /X /U /V
    echo Done processing %driveDef%: please check output info
    timeout /t 3 /nobreak> null
    goto doneCleaning
) else (
    echo The drive does not exist!
    pause>null
)
set dataDriveDef=false
if %driveDef%==cancel set dataDriveDef=true
if %driveDef%==back set dataDriveDef=true 
if %dataDriveDef==true (
    goto confirmExitCanc
)
goto errMes01

REM Manual Disk Clean Function
:mnlDCleanUp
echo Manual Cleaning... [Disk Cleanup]
echo Please choose drive to be clean manually...
fsutil fsinfo drives
set/p "driveClean=> "
if exist %driveClean%:/ (
    cleanmgr /d%driveClean%
    echo Successfully cleanup the drive %driveClean%:
    pause>null
) else (
    echo The drive does not exist!
    pause>null
)
goto mainMenu

REM Manual Fixer of Windows Error
:mnlFxWnErr
cls
echo # This is manual fix windows error
pause>null
goto mainMenu

REM =============================
REM Developers Menu
REM =============================
:devModeMenu
cls
echo This is dev mode menu
pause>null
goto mainMenu

REM =============================
REM Errors and Exits
REM =============================
:confirmExitCanc
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo # %desc%
echo # %divider%
echo # Are you sure you want to cancel/stop the current task?
set/p "confirmCanc=# %cliN%[y/N]> "
set dataCanc=false
if %confirmCanc%==yes set dataCanc=true
if %confirmCanc%==Yes set dataCanc=true
if %confirmCanc%==YES set dataCanc=true
if %confirmCanc%==y set dataCanc=true
if %confirmCanc%==Y set dataCanc=true
if %dataCanc%==true (
    goto mainMenu
) else (
    goto %previousMenu%
)
goto %previousMenu%

:errMes01
cls
echo Error 1
pause>null
goto mainMenu