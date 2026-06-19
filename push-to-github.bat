@echo off
cd /d "%~dp0"

:: Remove any stale git lock files
if exist ".git\index.lock" del /f ".git\index.lock"
if exist ".git\HEAD.lock" del /f ".git\HEAD.lock"

git add .

for /f "skip=1 tokens=1" %%i in ('wmic os get LocalDateTime') do (
  if not defined D set D=%%i
)
set D=%D:~0,4%-%D:~4,2%-%D:~6,2%

git commit -m "Briefing %D%" --allow-empty
git push origin main 2>nul || git push origin master 2>nul

IF ERRORLEVEL 1 (
  echo.
  echo Push failed — you may need to sign in to GitHub.
  pause
) ELSE (
  echo.
  echo Done — pushed to GitHub successfully.
  timeout /t 2 /nobreak >nul
)
