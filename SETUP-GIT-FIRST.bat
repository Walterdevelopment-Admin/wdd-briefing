@echo off
:: ============================================================
:: Walter D&D — One-Time Git Setup
:: Double-click to run. No typing needed.
:: ============================================================

cd /d "%~dp0"

where git >nul 2>&1
IF ERRORLEVEL 1 (
  echo ERROR: Git is not installed.
  echo Download from https://git-scm.com/download/win then run this again.
  pause & exit /b 1
)

echo Initialising git repo...
git init
git remote remove origin 2>nul
git remote add origin https://github.com/Walterdevelopment-Admin/wdd-briefing.git
git branch -M main

echo Adding files...
git add .
git commit -m "Initial commit — Walter D&D Morning Briefing"

echo Pushing to GitHub...
git push -u origin main

IF ERRORLEVEL 1 (
  echo.
  echo Push failed — this usually means you need to sign in.
  echo A browser window may open asking for GitHub login.
  echo After logging in, run push-to-github.bat to try again.
) ELSE (
  echo.
  echo Setup complete! Repo: https://github.com/Walterdevelopment-Admin/wdd-briefing
  echo From now on, just double-click push-to-github.bat to push updates.
)

pause
