@echo off

setlocal enabledelayedexpansion

cd /d %~dp0

for %%a in (*.txt) do (

    type "%%a" >nul 2>&1

    if !ERRORLEVEL! neq 0 (
        echo "[%%a] Error has occurred."
        rem メッセージ表示
		rem echo MsgBox "[%%a] Error has occurred.",vbInformation,"情報" > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
		echo MsgBox "[%%a] Error has occurred.",vbInformation,"注意" > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
 
    ) else (
        echo "[%%a] is OK."
        echo MsgBox "[%%a] is OK.",vbInformation,"情報" > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
    )
)
endlocal