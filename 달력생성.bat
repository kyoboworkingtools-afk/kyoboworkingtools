@echo off
cd /d "%~dp0"
echo.
echo ==============================
echo    HTML 달력 생성 중...
echo ==============================
echo.
python 엑셀_to_달력HTML.py
if %errorlevel% neq 0 (
    echo.
    echo    오류 발생. 위 메시지를 확인하세요.
    pause
    exit /b
)
echo.
echo    완료! 브라우저를 열고 있습니다...
echo    (이 창을 닫으면 달력이 닫힙니다)
echo.
for /f "delims=" %%f in ('dir /b /o-d *_달력.html 2^>nul') do (
    set HTMLFILE=%%f
    goto :found
)
:found
start /b python -m http.server 8765 2>nul
timeout /t 2 /nobreak > nul
start http://localhost:8765/%HTMLFILE%
echo    브라우저에서 달력을 확인하세요!
echo    주소: http://localhost:8765/%HTMLFILE%
echo.
pause
