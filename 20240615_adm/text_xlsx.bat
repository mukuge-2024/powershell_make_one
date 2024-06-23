@echo off
REM ここにバッチファイルの処理を記述

REM 例：PowerShellコマンドを実行
@powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath 'C:\Users\kuma\Desktop\20240615_adm\text_xlsx.vbs' -Verb RunAs"

pause
exit /b