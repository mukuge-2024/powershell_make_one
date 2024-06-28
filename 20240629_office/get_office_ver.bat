@echo off

set filename="office_ver.txt"

echo " ====== Office Version Start ======" >> %filename%

powershell -ExecutionPolicy RemoteSigned -Command "wmic product where \"Name like '%%Office%%'\" get name,version | Add-Content -Encoding UTF8 -Path %filename%"

echo " ====== Office Version END ======" >> %filename%

pause 