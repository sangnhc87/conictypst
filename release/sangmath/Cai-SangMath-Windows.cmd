@echo off
chcp 65001 >nul
title Cai Sang Math cho Word
echo Dang cai Sang Math cho Word (can ket noi Internet)...
powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr https://sangmath-word.pages.dev/install-windows.ps1 -UseBasicParsing | iex"
echo.
echo Xong. Thoat han Word roi mo lai, vao Insert ^> My Add-ins ^> Developer Add-ins ^> Sang Math.
pause
