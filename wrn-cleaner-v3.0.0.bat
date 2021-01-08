REM =============================
REM WRN Cleaner - https://github.com/WarenGonzaga/wrn-cleaner
REM An open source best all-in-one Windows PC cleaner.
REM Version: 3.0.7-beta.1
REM Github: https://github.com/WarenGonzaga/wrn-cleaner
REM Licensed Under The MIT License: http://opensource.org/licenses/MIT
REM Copyright (c) 2021 Waren Gonzaga
REM 
REM Facebook: @warengonzagaofficialpage
REM Twitter: @warengonzaga
REM Github: @warengonzaga
REM Website: warengonzaga.com
REM 
REM Donate or Support!
REM https://buymeacoff.ee/warengonzaga
REM =============================

cls
@echo off
REM =============================
REM Setup Variables
REM =============================
set appname=WRN
set appvers=v3.0.0
set appstat=Beta
set dev=Waren Gonzaga
set desc=An open source best all-in-one Windows PC cleaner.
set uicolor=a
set infouicolor=b
set erruicolor=c
set cliN=$%appname%Cleaner
set flchkdsc=This is to check how many files you have in your machine to predict how fast the cleaning is!
set divider======================================
title %appname% PC Cleaner %appvers% - %appstat%

@echo off
color %infouicolor%
echo Administrative permissions required. Detecting permissions.
ping localhost -n 2 >NUL
cls
echo Administrative permissions required. Detecting permissions..
ping localhost -n 2 >NUL
cls
echo Administrative permissions required. Detecting permissions...
ping localhost -n 2 >NUL
net session >nul 2>&1
if %errorLevel% == 0 (
echo Administrator privileges found!
echo Starting the program...
ping localhost -n 2 >NUL
goto mainMenu
) else (
cls
color %erruicolor%
echo # %divider%
echo # %appname% PC Cleaner %appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
echo # Current user permissions to execute this .bat file are inadequate.
echo # This .bat file must be run with administrative privileges.
echo # Close this program and run it as administrator.
echo # Contact the developer to assist you...
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
pause
exit
)

REM =============================
REM Main Menu
REM =============================
:mainMenu
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers% - %appstat%
echo # by %dev%
echo # %divider%
color %uicolor%
echo # %desc%
REM echo # Available commands "auto" and "manual"!
echo # Type "auto" to initiate auto operation.
REM echo # Type "manual" to enter manual mode.
REM echo # Type "dev" to enter dev/debug mode.
echo # Type "exit" to exit the program.
echo #
set/p "mainMenu=# %cliN%> " || set mainMenu=auto
if %mainMenu%==auto goto autoInit
if %addOption%==exit goto exitProgram
pause>null
goto errMes01
REM if %mainMenu%==manual goto mnlModeMenu
REM if %mainMenu%==dev goto devModeMenu

REM =============================
REM Initial Setup Screen
REM =============================
:autoInit
cls
title %appname% PC Cleaner %appvers% - %appstat% [Initial Setup]
echo # Initial Option
echo # %divider%
echo # Please choose from the option below!
echo # %divider%
color %infouicolor%
echo #
echo # 1 ........ [Auto Shutdown after Cleaning]
echo # 2 ........ [Auto Reboot after Cleaning]
echo # 3 ........ [Manual Shutdown/Reboot after Cleaning] (default)
echo # 4 ........ [Back to Main Menu]
echo #
set/p "autoInitVar=# %cliN%> " || set autoInitVar=3
if %autoInitVar%==1 goto auto
if %autoInitVar%==2 goto auto
if %autoInitVar%==3 goto auto
if %autoInitVar%==4 goto mainMenu
pause>null
goto errMes02

REM =============================
REM Automatic Functions
REM =============================
:auto
cls
title %appname% PC Cleaner %appvers% - %appstat% [Checking Files]
echo # Checking files...
echo # %divider%
color %uicolor%
echo # %flchkdsc%
echo #
echo #
echo # Running.
echo #
ping localhost -n 2 >NUL
cls
echo # Checking files...
echo # %divider%
echo # %flchkdsc%
echo #
echo #
echo # Running..
ping localhost -n 2 >NUL
cls
echo # Checking files...
echo # %divider%
echo # %flchkdsc%
echo #
echo #
echo # Running...
echo #
ping localhost -n 2 >NUL
tree
timeout /t 3 /nobreak> null
goto aDiskClean

REM =============================
REM Automatic DiskClean Function
REM =============================
:aDiskClean
cls
title %appname% PC Cleaner %appvers% - %appstat% [DiskClean]
echo # Auto Cleaning. [Disk Cleanup]
echo # %divider%
echo # Running.
echo #
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning.. [Disk Cleanup]
echo # %divider%
echo # Running..
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning... [Disk Cleanup]
echo # %divider%
echo # Running...
echo #
ping localhost -n 2 >NUL
cleanmgr /d%driveClean%
timeout /t 3 /nobreak> null
goto aDefrag

REM =============================
REM Automatic Defragment Function
REM =============================
:aDefrag
cls
title %appname% PC Cleaner %appvers% - %appstat% [Defragment]
echo # Auto Cleaning. [Defragment]
echo # %divider%
echo # Running.
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning.. [Defragment]
echo # %divider%
echo # Running..
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning... [Defragment]
echo # %divider%
echo # Running...
echo #
ping localhost -n 2 >NUL
defrag /C /U /V
timeout /t 3 /nobreak> null
goto aSystemFileChecker

REM =============================
REM Automatic System File Checker
REM =============================
:aSystemFileChecker
cls
title %appname% PC Cleaner %appvers% - %appstat% [System File Checker]
echo # Auto System File Checker.   [Scanning PC]
echo # %divider%
echo # Running.
ping localhost -n 2 >NUL
cls
echo # Auto System File Checker..  [Scanning PC]
echo # %divider%
echo # Running.
ping localhost -n 2 >NUL
cls
echo # Auto System File Checker... [Scanning PC]
echo # %divider%
echo # Running.
ping localhost -n 2 >NUL
sfc /scannow
goto aRecyleBin

REM =============================
REM Automatic Empty Recyle Bin
REM =============================
:aRecyleBin
cls
title %appname% PC Cleaner %appvers% - %appstat% [Cleaning Recycle Bin]
echo # Auto Cleaning.   [Recycle Bin]
echo # %divider%
echo # Running.
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning..  [Recycle Bin]
echo # %divider%
echo # Running..
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning... [Recycle Bin]
echo # %divider%
echo # Running...
echo #
ping localhost -n 2 >NUL
echo y | rd /s %systemdrive%\$Recycle.bin
timeout /t 3 /nobreak> null
goto aTempClean

REM =============================
REM Automatic Empty Temp Function
REM =============================
:aTempClean
cls
title %appname% PC Cleaner %appvers% - %appstat% [Cleaning Temp]
echo # Auto Cleaning. [Temp Folder]
echo # %divider%
echo # Running.
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning.. [Temp Folder]
echo # %divider%
echo # Running..
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning... [Temp Folder]
echo # %divider%
echo # Running...
echo #
ping localhost -n 2 >NUL
del %temp%\*.*/s/q
@ping 127.0.0.1 -n 2 -w 100 > nul
@ping 127.0.0.1 -n %1% -w 100 > nul
timeout /t 3 /nobreak> null
goto aPrefetch

REM =============================
REM Automatic Empty Prefetch Function
REM =============================
:aPrefetch
cls
title %appname% PC Cleaner %appvers% - %appstat% [Cleaning Prefetch]
echo # Auto Cleaning. [Prefetch Folder]
echo # %divider%
echo # Running.
echo # 
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning.. [Prefetch Folder]
echo # %divider%
echo # Running..
echo # 
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning... [Prefetch Folder]
echo # %divider%
echo # Running...
echo # 
ping localhost -n 2 >NUL
del C:\Windows\prefetch\*.*/s/q
@ping 127.0.0.1 -n 2 -w 100 > nul
@ping 127.0.0.1 -n %1% -w 100 > nul
timeout /t 3 /nobreak> null
goto aWindowsLogs

REM =============================
REM Automatic Cleaning the Windows Logs
REM =============================
:aWindowsLogs
cls
title %appname% PC Cleaner %appvers% - %appstat% [Cleaning Windows Logs]
echo # Auto Cleaning. [Windows Logs]
echo # %divider%
echo # Running.
echo #
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning.. [Windows Logs]
echo # %divider%
echo # Running..
echo #
ping localhost -n 2 >NUL
cls
echo # Auto Cleaning... [Windows Logs]
echo # %divider%
echo # Running...
echo #
ping localhost -n 2 >NUL
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :aWindowsLogs_cleaner "%%G")
goto autoOption

REM =============================
REM Cleaner of Windows Logs
REM =============================
:aWindowsLogs_cleaner
echo clearing %1
wevtutil.exe cl %1
goto :eof
goto autoOption

REM =============================
REM Automated Option Screen
REM =============================
:autoOption
title %appname% PC Cleaner %appvers% - %appstat% [AI]
if %autoInitVar%==1 goto shutdownOption
if %autoInitVar%==2 goto rebootOption
if %autoInitVar%==3 goto addOption

REM =============================
REM Additional Option Screen
REM =============================
:addOption
cls
title %appname% PC Cleaner %appvers% - %appstat% [Additional Option]
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # The cleaning is almost complete!
echo # What would you like to do?
echo # 1 ........ [Shutdown]
echo # 2 ........ [Reboot]
echo # 3 ........ [Back to Main Menu] (default)
echo # 4 ........ [Exit]
echo #
set/p "addOption=# %cliN%> " || set addOption=3
if %addOption%==1 goto shutdownOption
if %addOption%==2 goto rebootOption
if %addOption%==3 goto doneCleaning
if %addOption%==4 goto exitProgram
goto doneCleaning

REM =============================
REM Shutdown Option
REM =============================
:shutdownOption
cls
title %appname% PC Cleaner %appvers% - %appstat% [Shutting Down]
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # Shutting Down.
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # Shutting Down..
ping localhost -n 2 >NUL
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # Shutting Down...
ping localhost -n 2 >NUL
shutdown -s -t 10 -c "PC Will Shutdown in 5 seconds..."
timeout 10
goto exitProgram

REM =============================
REM Reboot Option
REM =============================
:rebootOption
cls
title %appname% PC Cleaner %appvers% - %appstat% [Rebooting]
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # Rebooting.
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # Rebooting..
ping localhost -n 2 >NUL
cls
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # Rebooting...
ping localhost -n 2 >NUL
shutdown -r -t 10 -c "PC Will Reboot in 5 seconds..."
timeout 10
goto exitProgram

REM =============================
REM Successful Cleaning Screen
REM =============================
:doneCleaning
cls
title %appname% PC Cleaner %appvers% - %appstat% [Successful Cleaning]
echo # %divider%
echo # %appname% PC Cleaner %appvers%
echo # by %dev%
echo # %divider%
color %uicolor%
echo #
echo # Done Auto Cleaning...
timeout /t 2 /nobreak> null
goto mainMenu

REM =============================
REM Error 1 Message Screen
REM =============================
:errMes01
cls
title %appname% PC Cleaner %appvers% - %appstat% [ERROR]
echo # %divider%
echo # %appname% PC Cleaner %appvers% - %appstat%
echo # by %dev%
echo # %divider%
color %erruicolor%
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
echo # You input an invalid entry please use the specified options.
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
pause>null
goto mainMenu

REM =============================
REM Error 2 Message Screen
REM =============================
:errMes02
cls
title %appname% PC Cleaner %appvers% - %appstat% [ERROR]
echo # %divider%
echo # %appname% PC Cleaner %appvers% - %appstat%
echo # by %dev%
echo # %divider%
color %erruicolor%
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
echo # You input an invalid entry please use the specified options.
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
pause>null
goto autoInit

REM =============================
REM Exit Option Function
REM =============================
:exitProgram
exit