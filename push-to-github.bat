@echo off
:: ============================================================
:: Walter D&D Morning Briefing — GitHub Push
:: Run this from the WDD-Briefing folder any time to push.
::
:: FIRST TIME SETUP (run once in Git Bash in this folder):
::   git init
::   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
::   git branch -M main
:: ============================================================

cd /d "%~dp0"

where git >nul 2>&1
IF ERRORLEVEL 1 (echo Git not found. Install Git and try again. & pause & exit /b 1)

git remote -v >nul 2>&1
IF ERRORLEVEL 1 (
  echo No git remote configured.
  echo Run SETUP-GIT-FIRST.bat or open Git Bash here and run:
  echo   git init
  echo   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
  pause & exit /b 1
)

git add morning-briefing-*.html
git add *.bat

for /f "skip=1 tokens=1" %%i in ('wmic os get LocalDateTime') do (
  if not defined D set D=%%i
)
set D=%D:~0,4%-%D:~4,2%-%D:~6,2%

git commit -m "Briefing %D%" --allow-empty
git push origin main 2>nul || git push origin master 2>nul

IF ERRORLEVEL 1 (
  echo Push may have failed. Check credentials / remote URL.
  pause
) ELSE (
  echo Done — briefing pushed to GitHub.
  timeout /t 2 /nobreak >nul
)
