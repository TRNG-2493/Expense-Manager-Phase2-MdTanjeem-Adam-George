@echo off
setlocal

REM Get the absolute path of the folder
set "projectpath=%~dp0"

@REM  Add database path to environment variable
set "DATABASE_PATH=%projectpath%expense_manager\database\db.db"

@REM ---- Start the Employee and Manager Apps ----
start "Employee App" /d "%projectpath%expense_manager\employee" cmd /k "call .venv\Scripts\activate.bat && python main.py"
start "Manager App" /d "%projectpath%expense_manager\manager" cmd /k "mvn exec:java -Dexec.mainClass=com.revature.Main"

REM ---- Small pause to allow the servers to start before opening the browser ----
timeout /t 5 /nobreak >nul
start "" "http://localhost:5000"
start "" "http://localhost:5001"

endlocal