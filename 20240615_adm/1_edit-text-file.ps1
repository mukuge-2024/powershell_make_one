#単一分のコメントです。
<#複数行の コメントアウトです。
#>

#### ----------------------------------------
#### PowerShell テキストファイルの行を取得する
#### ----------------------------------------

# テキストファイル名の指定
#$var_filename="test.txt"
$var_filename="adm_data.txt"
#$var_filename="jp_location.txt"

# $joinstr1 = -Join ($string1, $string2)
# $joinstr1 = $string1 + $string2
# Write-Output $joinstr1

$var_file_path = -Join ("C:\Users\kuma\Desktop\20240615_adm\", $var_filename)
# New-Variable var_filename_p -value "C:\Users\kuma\Desktop\20240615_adm\adm_data.txt"

$var_string="Policy"

#Select-String -Path $var_file_path -Pattern "_Policy="
Select-String -Path $var_file_path -Pattern "_Explain="



# 指定ファイルの最初からX行目までを取得する
# Get-Content テキストファイル名 | Select-Object -First X
# Get-Content $var_file_path | Select-Object -First 3
# Write-Output =======================
# 指定ファイルの最後から一行目のみを取得する
# (Get-Content $var_file_path)[-1]
# Write-Output =======================
# 指定ファイルの最後から二行目のみを取得する
# (Get-Content $var_file_path)[-2]
# Write-Output =======================
# 指定ファイルの二行目から四行目までを取得する
# (Get-Content $var_file_path)[0..2]
# Write-Output =======================
# 指定ファイルの2行目以降を取得する(一行目をスキップする)
# Get-Content $var_file_path | Select-Object -Skip 1
# Write-Output =======================