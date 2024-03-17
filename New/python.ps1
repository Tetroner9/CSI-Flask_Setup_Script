# -- Welcome Message --
Write-Host " "  # Add a blank line for better formatting
Write-Host "** Welcome to the Auotmated Programe Install Script!**" -ForegroundColor Green

# -- Check Internet Connection --
Write-Host " "  # Blank line
Write-Host "Checking your internet connection..." -ForegroundColor Cyan
if (!(Test-Connection -ComputerName google.com -Count 1 -Quiet)) {
    Write-Host " "  # Blank line
    Write-Host "Error: No internet connection detected." -ForegroundColor Red
    Write-Host "This script requires an internet connection to function properly." -ForegroundColor Red
    Write-Host "Please connect to the internet and try again." -ForegroundColor Red
    Exit
} else {
    Write-Host " "  # Blank line
    Write-Host "Internet connection detected! " -ForegroundColor Green
}

# -- Check Winget Availability --
Write-Host " "  # Blank line
Write-Host "Checking for Winget..." -ForegroundColor Cyan
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe) {
    Write-Host " "  # Blank line
    Write-Host "Winget is already installed." -ForegroundColor Green
} else {
    # Check Windows Version (alternative method)
    $osVersion = (Get-WmiObject Win32_OperatingSystem).Version.Split('.')[0]
    if ($osVersion -lt 10) {  # Check for Windows 10 (10.0.x)
        Write-Host " "  # Blank line
        Write-Host "Winget is not supported on this version of Windows (pre-10.0)." -ForegroundColor Red
        Exit
    } else {
        Write-Host " "  # Blank line
        Write-Host "Winget not found. We'll install it for you." -ForegroundColor Cyan
        Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget" -Wait
        Write-Host " "  # Blank line
        Write-Host "Winget installed successfully!" -ForegroundColor Green
    }
}

# -- Winget Updates and Software Installation --
Write-Host " "  # Blank line
Write-Host "Updating Winget..." -ForegroundColor Cyan
winget update

Write-Host " "  # Blank line
Write-Host "Preparing to install software..." -ForegroundColor Cyan
$softwareList = @("Python.Python.3.12", "Microsoft.VisualStudioCode")

foreach ($software in $softwareList) {
    $softwareStatusCheck = winget list | Where-Object { $_.Id -eq $software }
    if (!$softwareStatusCheck) {
        Write-Host " "  # Blank line
        Write-Host "Installing $software..." -ForegroundColor Green
        winget install $software
        Write-Host " "  # Blank line
        Write-Host "$software installed successfully!" -ForegroundColor Green
    } else {
        Write-Host " "  # Blank line
        Write-Host "$software is already installed." -ForegroundColor Cyan
    }
}

# -- Final Message --

Write-Host " "  # Blank line
Write-Host "All software installed successfully!" -ForegroundColor Green

Write-Host "Run the files.bat after closing all script windows"  -ForegroundColor Red

Write-Host "Press Enter to close the script..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Exit
