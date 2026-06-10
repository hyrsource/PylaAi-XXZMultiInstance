@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0."

set "TOML=cfg\instances.toml"
set "N=0"

for /f "tokens=*" %%L in ('findstr /R "^\[instances\." "%TOML%" 2^>nul') do (
    set /a N+=1
    set "LINE=%%L"
    set "LINE=!LINE:[instances.=!"
    set "LINE=!LINE:]=!"
    set "INST_!N!=!LINE: =!"
)

if %N%==0 (
    echo No instances found. Run multi_instance_add_instance.bat first.
    pause
    exit /b 1
)

:menu
cls
echo Select an instance to start:
echo.
for /l %%i in (1,1,%N%) do echo   %%i. !INST_%%i!
echo.
set /p "C=Enter number (1-%N%): "

set /a C_NUM=%C% 2>nul
if !C_NUM! lss 1 goto :menu
if !C_NUM! gtr %N% goto :menu

set "SEL=!INST_%C%!"
echo.
echo Starting !SEL!...
echo.
python main.py --instance !SEL!
pause
