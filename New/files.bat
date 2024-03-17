@echo off

rem Welcome message
echo Welcome to the Flask Project Setup Script!

rem Informative message about silent installation
echo This script will silently install Xampp and MongoDB Compass for Windows (64-bit).
echo **Please be aware that some Xampp components (FileZilla, Mercury, Tomcat, Perl, Webalizer, Sendmail) will be disabled for a minimal installation.**

pip install gdown 

gdown --folder 1Jiz9BBs4ypxa8bwRncFUroE7w_1Ayj3d

rem Xampp installation (silent, minimal)
echo Installing Xampp...
Setup-Files\xampp-windows-x64-8.2.12-0-VS16-installer.exe --unattendedmodeui minimal --mode unattended --disable-components xampp_filezilla,xampp_mercury,xampp_tomcat,xampp_perl,xampp_webalizer,xampp_sendmail

rem MongoDB Server installation (silent)
echo Installing MongoDB Server...
Setup-Files\mongodb-windows-x86_64-7.0.6-signed.msi 

rem Create Flask-Project directory
echo Creating Flask-Project directory...
mkdir Flask-Project

rem Enter Flask-Project directory
echo Entering Flask-Project directory...
cd Flask-Project

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

rem Create main.py file
echo ** Creating main.py file...**
echo print("Hello, Flask") > main.py

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
