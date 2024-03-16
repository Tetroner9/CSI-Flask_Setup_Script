@ECHO OFF

TITLE Flask Project Setup

echo.  

echo ** Welcome to the Flask Project Setup Assistant!**
echo.

echo ** Creating project directory...**
mkdir Flask-Project

echo.

echo ** Changing directory...**
cd Flask-Project

echo.

echo ** Creating virtual environment (.venv)...**
python -m venv .venv

echo.

echo ** Activating virtual environment...**
call ".venv\Scripts\activate.bat"

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
