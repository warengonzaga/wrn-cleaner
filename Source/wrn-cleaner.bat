cls
@echo off
title MS365 PC Cleaner v0.1
goto mainMenu

:mainMenu
cls
echo =========================
echo MS365 PC Cleaner v0.1
echo by MS365 Developers 2017
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
goto mainMenu

:manualOp
cls
echo Manual Cleaning... [Defragment]
echo Please choose drive to be defrag manually...
fsutil fsinfo drives
set/p "drive=> "
if exist %drive%:/ (
    defrag %drive%: /X /U /V
    echo Successfully defrag the drive %drive%:
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