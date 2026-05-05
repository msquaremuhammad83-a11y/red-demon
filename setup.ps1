# ZERODAY WARRIORS - Setup Script for Windows

Write-Host "Setting up ZERODAY WARRIORS Toolkit..." -ForegroundColor Cyan

# Check for Python
if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "[+] Python found in PATH." -ForegroundColor Green
} else {
    Write-Host "[*] Python not found in PATH. Searching in common locations..." -ForegroundColor Yellow
    $commonPath = "$env:LOCALAPPDATA\Programs\Python\Python314\python.exe"
    if (Test-Path $commonPath) {
        Write-Host "[+] Found Python at $commonPath. Adding to current session PATH..." -ForegroundColor Green
        $env:PATH += ";$env:LOCALAPPDATA\Programs\Python\Python314;$env:LOCALAPPDATA\Programs\Python\Python314\Scripts"
    } else {
        Write-Host "[-] Python not found. Please install Python from python.org" -ForegroundColor Red
        exit
    }
}

# Install dependencies
Write-Host "[*] Installing dependencies from requirements.txt..." -ForegroundColor Yellow
python -m pip install -r requirements.txt

# Add to PowerShell Profile for persistence
Write-Host "[*] Adding Python to PowerShell profile for global access..." -ForegroundColor Yellow
$profilePath = $PROFILE
if (!(Test-Path $profilePath)) { New-Item -Type File -Path $profilePath -Force | Out-Null }
$aliasCmd = "function python { & '$env:LOCALAPPDATA\Programs\Python\Python314\python.exe' `$args }"
if (!(Select-String -Path $profilePath -Pattern "function python").Length) {
    Add-Content -Path $profilePath -Value "`n$aliasCmd"
    Write-Host "[+] Python alias added to profile." -ForegroundColor Green
}

if ($LASTEXITCODE -eq 0) {
    Write-Host "[+] Dependencies installed successfully." -ForegroundColor Green
} else {
    Write-Host "[-] Failed to install dependencies." -ForegroundColor Red
}

Write-Host "`nTo start the toolkit, run:" -ForegroundColor Cyan
Write-Host "python toolkit.py" -ForegroundColor Yellow
