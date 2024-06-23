@echo off
rem powershell -executionpolicy RemoteSigned -File "%~dp0%~n0.ps1"
cd /d %~dp0

rem ↑を総括すると、バッチと同じフォルダ\バッチと同じファイル名.ps1

rem echo "[%~dp0]:" %~dp0
rem echo "[%~n0.ps1]:" %~n0.ps1

rem powershell -executionpolicy RemoteSigned -File "%~dp0%~n0.ps1"
rem powershell -executionpolicy RemoteSigned -File "%~dp0WindowsBatLister.ps1"

cmd /c powershell "%~dp0%~n0.ps1"
