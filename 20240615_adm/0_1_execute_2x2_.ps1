#単一分のコメントです。
<#複数行の コメントアウトです。
#>

#### ----------------------------------------
#### PowerShell テキストファイルの行を取得する
#### ----------------------------------------

# テキストファイル名の指定
$var_filename="adm_data_1.txt"
$var_file_path = -Join ("C:\Users\kuma\Desktop\20240615_adm\", $var_filename)
$var_string_policy="_Policy="
$var_string_explain="_Explain="

# PowerShellでテキストファイルを１行ずつ読み込むサンプルコード 

# 変数宣言
[string[][]]$columns = @()
[string[]]$column = @()


# 文字コードを変更
$enc = [Text.Encoding]::GetEncoding("UTF-8")
$file_content = New-Object System.IO.StreamReader($var_file_path, $enc)



# _Policy= の内容を$columnに要素を追加して代入
# -----------------
while (($line_p = $file_content.ReadLine()) -ne $null) {
	#Write-Host $i : $line_p
	if ($line_p.Contains($var_string_policy)){
		# Write-Host $i : $line_p
		$column += $line_p
	}
	$i++
}	

$file_content.Close()
# $columnを配列として$columnsを代入
$columns += ,@($column)

# $columnを空にする
[string[]]$column = @()

$file_content_e = New-Object System.IO.StreamReader($var_file_path, $enc)

# _Explain= の内容を$columnに要素を追加して代入
# -----------------
while (($line_e = $file_content_e.ReadLine()) -ne $null) {
	#Write-Host $i : $line_e
	if ($line_e.Contains($var_string_explain)){
		#Write-Host $i : $line_e
		$column += $line_e
	}
    $i++
}

# 再度$columnを配列として$columnsを代入
$columns += ,@($column)


# $columnを空にする
[string[]]$column = @()
$file_content_e.Close()

# 以降ファイル数分を繰り返す。
Write-Host ($columns[0][0] + "," + $columns[1][0])
Write-Host ($columns[0][1] + "," + $columns[1][1])
Write-Host ($columns[0][2] + "," + $columns[1][2])
Write-Host ($columns[0][3] + "," + $columns[1][3])

$columns[0][0] + "`t" + $columns[1][0] >> _output.txt
$columns[0][1] + "`t" + $columns[1][1] >> _output.txt
$columns[0][2] + "`t" + $columns[1][2] >> _output.txt
$columns[0][3] + "`t" + $columns[1][3] >> _output.txt

# Select-String -Path $var_file_path -Pattern "_Policy="
# Select-String -Path $var_file_path -Pattern "_Explain="
