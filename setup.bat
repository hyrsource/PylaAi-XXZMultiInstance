@echo off
setlocal enabledelayedexpansion
title PylaAi-XXZ Setup

set "PY311=%LOCALAPPDATA%\Programs\Python\Python311\python.exe"
set "PYTHON=python"

python --version 2>nul | findstr "3.11" >nul
if not errorlevel 1 goto :deps

if exist "!PY311!" (
    set "PYTHON=!PY311!"
    goto :deps
)

echo Downloading Python 3.11.9...
curl -L --progress-bar -o "%TEMP%\py-3119.exe" "https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe"
if errorlevel 1 (
    echo Download failed. Install Python 3.11 manually from python.org then re-run.
    pause
    exit /b 1
)

echo Installing Python 3.11.9...
"%TEMP%\py-3119.exe" /quiet InstallAllUsers=0 PrependPath=1 Include_test=0
if errorlevel 1 (
    echo Install failed. Try running setup.bat as Administrator.
    pause
    exit /b 1
)
del "%TEMP%\py-3119.exe" >nul 2>&1
set "PYTHON=!PY311!"

:deps
echo.
echo Upgrading pip...
"!PYTHON!" -m pip install --upgrade pip --quiet

echo Installing numpy...
"!PYTHON!" -m pip install numpy==1.26.4 --force-reinstall --no-deps --quiet

echo Installing core packages...
"!PYTHON!" -m pip install ^
    Pillow>=10.0.0 ^
    aiohttp ^
    requests ^
    packaging>=23.0 ^
    toml>=0.10.2 ^
    psutil>=7.0.0 ^
    websockets>=15.0 ^
    discord.py>=2.3.2 ^
    customtkinter>=5.2.0 ^
    PySide6>=6.7.0 ^
    pyautogui>=0.9.54 ^
    easyocr ^
    ultralytics ^
    google-play-scraper ^
    --quiet

echo Installing adb and av...
"!PYTHON!" -m pip install adbutils==2.12.0 av==12.3.0 --quiet

echo Installing PyTorch (CPU)...
"!PYTHON!" -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu --quiet

echo Installing ONNX Runtime (DirectML)...
"!PYTHON!" -m pip install onnxruntime-directml==1.24.4 --quiet

echo Installing scrcpy client...
"!PYTHON!" -m pip install "https://github.com/leng-yue/py-scrcpy-client/archive/refs/tags/v0.5.0.zip" --no-deps --quiet

echo Pinning opencv...
"!PYTHON!" -m pip uninstall opencv-python opencv-python-headless -y >nul 2>&1
"!PYTHON!" -m pip install opencv-python==4.8.0.76 --force-reinstall --no-deps --quiet

echo Pinning numpy...
"!PYTHON!" -m pip install numpy==1.26.4 --force-reinstall --no-deps --quiet

cls
echo.
echo ============================================================
echo   Setup Complete! Run multi_instance_add_instance.bat
echo ============================================================
echo.
pause
