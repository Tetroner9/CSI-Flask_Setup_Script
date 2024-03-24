@echo off

rem Welcome message
echo Welcome to the Flask Project Setup Script!

rem Informative message about silent installation
echo This script will silently install Xampp and MongoDB Compass for Windows (64-bit).
echo **Please be aware that some Xampp components (FileZilla, Mercury, Tomcat, Perl, Webalizer, Sendmail) will be disabled for a minimal installation.**

pip install gdown 

rem Download folder with ID 10r5JpqjVDM54wMH7DQTbPZ9S_cwTabqm
gdown --folder 10r5JpqjVDM54wMH7DQTbPZ9S_cwTabqm
if ERRORLEVEL 1 (
  echo Download failed for folder 1
  rem Download folder with ID 16-fjPPXNmyAx7eygiam6MIFc-Q5psaFI
  gdown --folder 16-fjPPXNmyAx7eygiam6MIFc-Q5psaFI
  if ERRORLEVEL 1 (
    echo Download failed for folder 2
    rem Download folder with ID 1Er0dbPRmW464loiPZq8Y-U7N3iARI2fu
    gdown --folder 1Er0dbPRmW464loiPZq8Y-U7N3iARI2fu
    if ERRORLEVEL 1 (
      echo Download failed for 3
      echo If all download folders failed, please download the files manually from one of the following links and place them in the Setup-Files directory: 
      echo https://drive.google.com/drive/folders/10r5JpqjVDM54wMH7DQTbPZ9S_cwTabqm?usp=sharing
      echo https://drive.google.com/drive/folders/16-fjPPXNmyAx7eygiam6MIFc-Q5psaFI?usp=sharing
      echo https://drive.google.com/drive/folders/1Er0dbPRmW464loiPZq8Y-U7N3iARI2fu?usp=sharing
      pause
      exit
    )
  )
)

rem Xampp installation (silent, minimal)
echo Installing Xampp...
Setup-Files\xampp-windows-x64-8.2.12-0-VS16-installer.exe --unattendedmodeui minimal --mode unattended --disable-components xampp_filezilla,xampp_mercury,xampp_tomcat,xampp_perl,xampp_webalizer,xampp_sendmail

rem MongoDB Server installation (silent)
echo Installing MongoDB Server...
Setup-Files\mongodb-windows-x86_64-7.0.6-signed.msi /passive /norestart ADDLOCAL="all" 

rem Clone GitHub Repo...
echo Cloning Github Repo...
git clone https://github.com/CSI-SFIT/Flask-Forward-Fundamentals-and-Beyond

cd Flask-Forward-Fundamentals-and-Beyond

rem Create Python virtual environment
echo Creating Python virtual environment...
python -m venv .venv

rem Activate virtual environment
echo ** Activating virtual environment...**
call ".venv\Scripts\activate"

rem Download requirements.txt
echo ** Downloading dependencies...**
curl -O -f https://raw.githubusercontent.com/Tetroner9/CSI/main/requirements.txt

rem Install dependencies
echo ** Installing dependencies...**
pip install -r requirements.txt

rem Install Python Extension
echo ** Installing python extension **
code --install-extension ms-python.python

rem Open VS Code (avoid automatic launch)
echo ** Opening Vs Code **
start code .

rem Completion message
echo.
echo ** All tasks completed!**
echo.
echo ** Happy coding!**

rem Exit with user interaction
echo.
echo ** Press any key to exit...**
pause

exit
