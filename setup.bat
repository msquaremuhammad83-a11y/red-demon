@echo off
SETLOCAL EnableDelayedExpansion

echo Setting up ZERODAY WARRIORS Toolkit for CMD...

:: Check for Python in PATH
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [+] Python found in PATH.
) else (
    echo [*] Python not found in PATH. Searching in local app data...
    set "PYTHON_PATH=%LOCALAPPDATA%\Programs\Python\Python314"
    if exist "!PYTHON_PATH!\python.exe" (
        echo [+] Found Python at !PYTHON_PATH!. Adding to session PATH...
        set "PATH=%PATH%;!PYTHON_PATH!;!PYTHON_PATH!\Scripts"
    ) else (
        echo [-] Python not found. Please install Python from python.org
        pause
        exit /b 1
    )
)

:: Install dependencies
echo [*] Installing dependencies from requirements.txt...
python -m pip install -r requirements.txt

if %ERRORLEVEL% EQU 0 (
    echo [+] Dependencies installed successfully.
) else (
    echo [-] Failed to install dependencies.
)

echo.
echo To start the toolkit, run:
echo python toolkit.py
pause
