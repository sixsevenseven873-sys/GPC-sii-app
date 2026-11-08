@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ===== สร้างตัวติดตั้ง GPC SHI (Setup.exe) =====
echo ต้องคลิกขวาที่ไฟล์นี้แล้วเลือก "Run as administrator" (เรียกใช้ในฐานะผู้ดูแลระบบ)
where node >nul 2>nul
if errorlevel 1 (
  echo ยังไม่ได้ติดตั้ง Node.js กรุณาติดตั้งจาก https://nodejs.org
  pause
  exit /b 1
)
call npm install
if errorlevel 1 goto fail
call npm run installer
if errorlevel 1 goto fail
echo สำเร็จ! ตัวติดตั้งอยู่ในโฟลเดอร์ dist-installer
start "" "%~dp0dist-installer"
pause
exit /b 0
:fail
echo เกิดข้อผิดพลาด ดูข้อความด้านบน
pause
exit /b 1
