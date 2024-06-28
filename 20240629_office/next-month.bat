@echo off
setlocal
FOR /F "usebackq delims=" %%A IN (`powershell "(Get-Date).AddMonths(1).ToString('yyyy-MM-dd')"`) DO set next_month=%%A
echo %next_month%

set ps_command=`powershell "(Get-Date).AddMonths(1).ToString('yyyy-MM-dd')"`
FOR /F "usebackq delims=" %%A IN (%ps_command%) DO set result=%%A
echo %result%

pause