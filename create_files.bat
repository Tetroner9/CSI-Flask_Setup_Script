@ECHO OFF

REM Create the directory named Flask-Project
mkdir Flask-Project

REM Change directory to Flask-Project
cd Flask-Project

REM Create a Python virtual environment named .venv
python -m venv .venv

REM Activate the virtual environment (adjust for your OS)
call ".venv\Scripts\activate.bat" 

curl -O -f https://raw.githubusercontent.com/Tetroner9/CSI/main/requirements.txt

REM Install Flask using pip in the virtual environment
pip -r requirements.txt

REM Create a file named main.py with "Hello,Flask" content
echo print("Hello,Flask") > main.py

REM Open VS Code in the current directory
start code . 

echo All tasks completed!

exit