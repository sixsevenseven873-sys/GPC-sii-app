@echo off
chcp 65001 >nul
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo ยังไม่ได้ติดตั้ง Node.js กรุณาติดตั้งจาก https://nodejs.org
  pause
  exit /b 1
)
call npm install
call npm start
