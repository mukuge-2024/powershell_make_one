#単一分のコメントです。
<#複数行の コメントアウトです。
#>

#### ----------------------------------------
#### PowerShell テキストファイルの行を取得する
#### ----------------------------------------

# テキストファイル名の指定
$var_filename="adm_data.txt"
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
while (($line = $file_content.ReadLine()) -ne $null) {
	if ($line.Contains($var_string_policy)){
		Write-Host $i : $line
		$arr[0] = $line.split("=")
		#$arr = $str -split "[,:]"
		Write-Host $i : $arr[0]
		$arr[0] >> _policy.txt
	} elseif  ($line.Contains($var_string_explain)){
		Write-Host $i : $line
		$line >> _explain.txt
	}
    $i++
}

#Select-String -Path $var_file_path -Pattern "_Policy="
Select-String -Path $var_file_path -Pattern "_Explain="
