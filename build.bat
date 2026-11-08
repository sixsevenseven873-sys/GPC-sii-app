@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ===== สร้างโปรแกรม GPC SHI (.exe) =====
where node >nul 2>nul
if errorlevel 1 (
  echo ยังไม่ได้ติดตั้ง Node.js กรุณาติดตั้งจาก https://nodejs.org แล้วดับเบิลคลิกไฟล์นี้ใหม่
  pause
  exit /b 1
)
echo.
echo [1/2] กำลังติดตั้งส่วนประกอบ (ต้องต่ออินเทอร์เน็ต ใช้เวลาสักครู่)...
call npm install
if errorlevel 1 goto fail
echo.
echo [2/2] กำลังสร้างโปรแกรม...
call npm run pack
if errorlevel 1 goto fail
echo.
echo สำเร็จ! เปิดโฟลเดอร์ dist แล้วดับเบิลคลิก "GPC SHI.exe" ในโฟลเดอร์ GPC SHI-win32-x64
start "" "%~dp0dist"
pause
exit /b 0
:fail
echo.
echo เกิดข้อผิดพลาด ดูข้อความด้านบน
pause
exit /b 1
