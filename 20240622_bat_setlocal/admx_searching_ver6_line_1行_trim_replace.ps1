#単一分のコメントです。
<#複数行の コメントアウトです。
#>

#### ----------------------------------------
#### PowerShell テキストファイルの行を取得する
#### ----------------------------------------

# テキストファイル名の指定
$var_input_filename="SystemRestore.admx.txt"
$var_input_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $var_input_filename)
$var_output_filename="SystemRestore.admx_ouput.txt"
$var_output_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $var_output_filename)
$var_string_1="<policy name="
$var_string_2="key="

# PowerShellでテキストファイルを１行ずつ読み込むサンプルコード 

# 変数宣言
[string[][]]$columns = @()
[string[]]$column = @()
[string[]]$arr = @()

if(Test-Path $var_output_file_path){
	# Write-Host "ファイルを削除します。"
	Remove-Item $var_output_file_path
}else{
	Write-Host "ファイルは存在しません。"
} 

$fileName_output = $var_output_file_path + $var_output_filename
$file_output = New-Object System.IO.StreamWriter($fileName_output, $false, [System.Text.Encoding]::GetEncoding("sjis"))

<#
0: <policy name=
1:  "SR_DisableConfig" class=  ⇒ 必要
2:  "Machine" displayName=
3:  "$(string.SR_DisableConfig)" explainText=
4:  "$(string.SR_DisableConfig_Help)" key= ⇒ 必要
5:  "Software\Policies\Microsoft\Windows NT\SystemRestore" valueName= ⇒ 必要
6:  "DisableConfig">  ⇒ 必要
#>

function string_replace {
	Param(
        $Arg1,  # 改行する場合はカンマを忘れずに
        $Arg2
    )


}


# 文字コードを変更
# $enc=[Text.Encoding]::GetEncoding("sjis")
$enc=[System.Text.Encoding]::GetEncoding("sjis")
# $file_content = New-Object System.IO.StreamReader($var_input_file_path, $enc)
$file_content = New-Object System.IO.StreamReader($var_input_file_path, $enc)
$i=0
while (($line = $file_content.ReadLine()) -ne $null) {
	if (-not ([string]::IsNullOrEmpty($line))) {
		# if (($line.Contains($var_string_1)) -or ($line.Contains($var_string_explain))){
		if (($line.Contains($var_string_1))){
			# Write-Host $i : $line
			$line = $line -replace '\"',""
			$items = $line -split "="
			Write-Host "置換前:"$items[1]
			# $item1 = $items[1] -replace "*class","AA"      # nameで分割した一つ目を取得
			# $str = "--12345--" -replace "[0-9]{5}", "*****"
			Write-Host "Length: $($items[1].Length)"
			$item1 = $items[1].trim()
			$item1 = $items[1] -replace "class",""   # nameで分割した一つ目を取得
			Write-Host "置換後:"$item1
			Write-Host "Trimmed Length: $($item1.Length)"
			$item4 = $items[4].Replace(" key=","")        # explainTextで分割した一つ目を取得
			$item5 = $items[5].Replace(" valueName=","")  # keyで分割した一つ目を取得
			$item6 = $items[6].Replace("> ","")           # valueNameで分割した一つ目を取得
			if (-not ([string]::IsNullOrEmpty($item1))) {
				[string]$result = [string]$i + "," + $item1 + "," + $item4 + "," + $item5 + "," + $item6
				Write-Host($result)
				
				# [string]$result >> $var_output_file_path
				# Set-Content $result
				# Set-Content ファイルパス 文字列 -Encoding utf8
				# Write-Output "かきくけこ" | Add-Content $var_output_file_path -Encoding Default
				Write-Output $result | Add-Content $var_output_file_path -Encoding Default
			}
		}
	}
	$i++
}

$file_content.close()
$file_output.Close()
Write-Host("終了")

