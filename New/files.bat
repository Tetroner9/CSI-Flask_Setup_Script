pip install gdown

gdown --folder 1Jiz9BBs4ypxa8bwRncFUroE7w_1Ayj3d

echo Installing Xampp...
:: Installs Xampp
Setup-Files\xampp-windows-x64-8.2.12-0-VS16-installer.exe --unattendedmodeui minimal --mode unattended --disable-components xampp_filezilla,xampp_mercury,xampp_tomcat,xampp_perl,xampp_webalizer,xampp_sendmail

echo Installing MongoDB Compass...

Setup-Files\mongodb-compass-1.42.2-win32-x64.exe /qn /norestart

echo Deleting Setup files...
:: Removes setup files
setlocal

set /p confirm=Do you want to remove the Setup-Files directory and its contents? (y/n): 
if /i "%confirm%"=="y" (
    rmdir /s /q Setup-Files
    echo Setup-Files directory and its contents removed successfully.
) else (
    echo Removal cancelled. Setup-Files directory and its contents were not removed.
)
endlocal

echo Creating Flask-Project directory...
:: Create Flask-Project directory
mkdir Flask-Project

echo Entering Flask-Project directory...
:: Change directory to Flask-Project
cd Flask-Project

echo Creating Python virtual environment...
:: Create Python virtual environment
python -m venv .venv

echo.

echo ** Activating virtual environment...**
call ".venv\Scripts\activate"

echo.

echo ** Downloading dependencies...**
curl -O -f https://raw.githubusercontent.com/Tetroner9/CSI/main/requirements.txt

echo.

echo ** Installing dependencies...**
pip install -r requirements.txt

echo.

echo ** Creating main.py file...**
echo print("Hello,Flask") > main.py

echo.

echo ** Opening VS Code...**
start code .

echo.

echo ** All tasks completed!**

echo.

echo ** Happy coding!**

echo.

echo ** Press enter to exit...** pause

exit
