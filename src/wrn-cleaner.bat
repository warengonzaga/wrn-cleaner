cls
@echo off
set appname=WRN
set appvers=v0.1
set dev=Waren Gonzaga
title %appname% PC Cleaner %appvers%
goto mainMenu

:mainMenu
cls
echo =========================
echo %appname% PC Cleaner %appvers%
echo by Waren Gonzaga
echo =========================
color c
echo Tools and Optimization
echo .
echo type auto for one click optimization and clean
set/p "menu=> "
if %menu%==auto goto autOp
if %menu%==manual goto manualOp
goto err1

:autOp
goto aDefrag

:aDefrag
cls
echo Auto Cleaning... [Defragment]
defrag /C /U /V
pause>null
goto aDiskClean

:manualOp
cls
echo Manual Cleaning... [Defragment]
echo Please choose drive to be defrag manually...
fsutil fsinfo drives
set/p "driveDef=> "
if exist %driveDef%:/ (
    defrag %driveDef%: /X /U /V
    echo Successfully defrag the drive %driveDef%:
    pause>null
) else (
    echo The drive does not exist!
    pause>null
)
goto mainMenu

:aDiskClean
echo Auto Cleaning... [Disk Cleanup]
cleanmgr /d%driveClean%
goto mainMenu

:manualDiskClean
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

:err1
cls
echo Error 1
pause>null
goto mainMenu