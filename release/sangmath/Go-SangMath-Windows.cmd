@echo off
chcp 65001 >nul
set SM_REMOVE=1
powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr https://sangmath-word.pages.dev/install-windows.ps1 -UseBasicParsing | iex"
pause
