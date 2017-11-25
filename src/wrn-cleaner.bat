cls
@echo off
set appname=WRN
set appvers=v0.1
set dev=Waren Gonzaga
set desc=An Open Source Best PC Cleaner
set uicolor=a
set cliN=$%appname%Cleaner
set divider==========================
title %appname% PC Cleaner %appvers%
goto mainMenu

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

:auto
goto aDefrag

:aDefrag
cls
echo Auto Cleaning... [Defragment]
defrag /C /U /V
pause>null
goto aDiskClean

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
    pause>null
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

:mnlFxWnErr
cls
echo # This is manual fix windows error
pause>null
goto mainMenu

:devModeMenu
cls
echo This is dev mode menu
pause>null
goto mainMenu

:aDiskClean
echo Auto Cleaning... [Disk Cleanup]
cleanmgr /d%driveClean%
goto mainMenu

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