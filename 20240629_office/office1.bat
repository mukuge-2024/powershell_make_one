@echo off

REM wmic product where "Name like '%%Office%%'" get name,version > office.txt
REM Get-Content -Path .\office.txt | Select-Object $_.version | Set-Content -Encoding UTF8 -Path .\output.txt
REM create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

REM @powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

REM @powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof



set filename="file.txt"

echo "Hello, World!!" >> %filename%

powershell -ExecutionPolicy RemoteSigned -Command "wmic product where \"Name like '%%Office%%'\" get name,version | Add-Content -Encoding UTF8 -Path %filename%"

pause 


$o365build = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" -ErrorAction SilentlyContinue).VersionToReport

で、32-bit (x86) と 64-bit (x64) は、

if((Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" -ErrorAction SilentlyContinue).Platform -eq "x64") {
  $o365bitness = "64-bit"
} else{
  $o365bitness = "32-bit"
}

で、製品名は

$o365name = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion | ? {($_.DisplayVersion -eq $o365build ) -and (($_.DisplayName -like "Microsoft 365 Apps *") -Or ($_.DisplayName -like "Microsoft Office *"))})

Write-Host $o365name.DisplayName "(Build " $o365build") "$o365bitness


reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s | find "Office"

C:\Users\kuma4>reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s | find "Office"
    
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | find "Office"


for /f "tokens=1" %%i in (target.txt) do wmic /node:%%i /user:"＜リモート端末のユーザ名＞" /password:"＜リモート端末のパス＞" PRODUCT list /format:CSV > D:\Work\temp\%%i.csv