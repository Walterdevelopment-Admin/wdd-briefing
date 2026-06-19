@echo off
:: ============================================================
:: Walter D&D — Auto-Open Gmail + Today's Briefing
::
:: TO RUN ON WINDOWS STARTUP:
::   Press Win+R → type: shell:startup → Enter
::   Copy THIS FILE into that Startup folder.
:: ============================================================

:: Wait for network / Chrome to be ready after boot
timeout /t 10 /nobreak >nul

SET BRIEFING_DIR=C:\Users\David C\Desktop\Claude-Workspace\WDD-Briefing

:: Build today's date (YYYY-MM-DD)
for /f "skip=1 tokens=1" %%i in ('wmic os get LocalDateTime') do (
  if not defined TODAY set TODAY=%%i
)
set TODAY=%TODAY:~0,4%-%TODAY:~4,2%-%TODAY:~6,2%

SET CHROME="C:\Program Files\Google\Chrome\Application\chrome.exe"
SET BRIEFING_FILE=%BRIEFING_DIR%\morning-briefing-%TODAY%.html

:: Open Gmail
start "" %CHROME% "https://mail.google.com"
timeout /t 2 /nobreak >nul

:: Open today's briefing (or most recent if not yet generated)
IF EXIST "%BRIEFING_FILE%" (
  start "" %CHROME% "%BRIEFING_FILE%"
) ELSE (
  for /f "delims=" %%F in ('dir /b /o-d "%BRIEFING_DIR%\morning-briefing-*.html" 2^>nul') do (
    start "" %CHROME% "%BRIEFING_DIR%\%%F"
    goto :done
  )
)
:done
