Get-ChildItem -Path C:\Users\kuma\Desktop\20240615_adm -Name -Include *.txt
Write-Output =======================
Get-ChildItem -Path C:\Users\kuma\Desktop\20240615_adm -Recurse -Force
# Get-ChildItem -Path C:\Users\kuma\Desktop\20240615_adm\test.txt
Write-Output =======================

#$var_file_path = "C:\Users\kuma\Desktop\20240615_adm\jp_location.txt"
# Select-String -Path $var_file_path -Pattern "府"
#Select-String "府" $var_file_path 
