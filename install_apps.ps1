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
    # Check Windows Version (optional, edit as needed)
    $osVersion = Get-Version (Get-WmiObject Win32_OperatingSystem).Version
    if ($osVersion -lt (New-Version "10.0.1809")) {
        Write-Host " "  # Blank line
        Write-Host "Winget is not supported on this version of Windows (pre-1809)." -ForegroundColor Red
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
$softwareList = @("Python.Python.3.12", "ApacheFriends.Xampp.8.2", "Microsoft.VisualStudioCode", "MongoDB.Compass.Full")

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

# -- Download post.bat Script --
Write-Host " "  # Blank line
Write-Host "Downloading additional script (post.bat)..." -ForegroundColor Cyan
$downloadUrl = "https://raw.githubusercontent.com/Tetroner9/CSI-Main/main/post.bat"
$downloadPath = ".\"
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($downloadUrl, $downloadPath + "\post.bat")

Write-Host " "  # Blank line
Write-Host "post.bat downloaded successfully." -ForegroundColor Green

# -- Completion and Execution --
Write-Host " "  # Blank line
Write-Host "** All checks and installations completed!**" -ForegroundColor Green
Write-Host " "  # Blank line
Write-Host "** Run the create-project.bat file by double clicking**" -ForegroundColor Green
Write-Host " "  # Blank line
Write-Host "** Make sure to close all terminal or powershell windows**" -ForegroundColor Red
Write-Host " "  # Blank line

Write-Host "Press Enter to close the script..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# -- Log File for Reference (optional) --
Write-Host " "  # Blank line (optional)
Write-Host "Details of the process are logged in .\_install_log.txt for your reference." -ForegroundColor Cyan  # Optional

# Exit the script
Exit
