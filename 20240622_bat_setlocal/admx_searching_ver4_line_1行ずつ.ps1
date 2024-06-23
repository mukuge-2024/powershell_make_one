#単一分のコメントです。
<#複数行の コメントアウトです。
#>

#### ----------------------------------------
#### PowerShell テキストファイルの行を取得する
#### ----------------------------------------

# テキストファイル名の指定
$var_input_filename="adm_data.txt"
$var_input_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $var_input_filename)
$var_output_filename="adm_data_output.txt"
$var_output_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $var_output_filename)
$var_string_policy="_Policy="
$var_string_explain="_Explain="

# PowerShellでテキストファイルを１行ずつ読み込むサンプルコード 

# 変数宣言
[string[][]]$columns = @()
[string[]]$column = @()
[string[]]$arr = @()

Remove-Item $var_output_file_path

# 文字コードを変更
$enc = [Text.Encoding]::GetEncoding("UTF-8")
$file_content = New-Object System.IO.StreamReader($var_input_file_path, $enc)
$i=0
while (($line = $file_content.ReadLine()) -ne $null) {
	if (-not ([string]::IsNullOrEmpty($line))) {
		if (( $line.Contains($var_string_policy)) -or ($line.Contains($var_string_explain))){
			# Write-Host $i : $line
			$items = $line -split "="
			$item0 = $items[0] # <policy name=で分割した一つ目を取得
			$item1 = $items[1] # <policy name=で分割した一つ目を取得
			if (-not ([string]::IsNullOrEmpty($item0))) {
				$result = [string]$i + "," + $item0 + "," + $item1
				Write-Host($result)
				$result >> $var_output_file_path
			}
		}
	}
	$i++
}

