#単一分のコメントです。
<#複数行の コメントアウトです。
#>

#### ----------------------------------------
#### PowerShellでテキストファイルを１行ずつ読み込む
#### ----------------------------------------

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
        $Arg1,  # path
        $Arg2,  # input_filename
        $Arg3,  # output_filename
        $Arg4,  # String_1(Name)
        $Arg5,  # String_2(key)
        $Arg6   # String_3(valueName)
    )
    
    # Write-Host "引数1：$Arg1 引数2：$Arg2 引数3：$Arg3"

	$fileName_input = $Arg1 + "\" + $Arg2
	# 文字コードを変更
	$enc_input = [System.Text.Encoding]::GetEncoding("sjis")
	$file_input = New-Object System.IO.StreamReader($fileName_input, $enc_input)
		
	$fileName_output = $Arg1 + "\" + $Arg3
	# $var_output_filename="SystemRestore.admx_ouput_.txt"
	# $fileName_output = $Arg1 + "\" + $var_output_filename
	# $var_output_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $Arg3)
	# $enc_output = [System.Text.Encoding]::GetEncoding("sjis")
	# $file_output = New-Object System.IO.StreamWriter($fileName_output, $false, $enc_output)	

    Write-Host $fileName_output
    if(Test-Path $fileName_output){
		Write-Host "ファイルを削除します。"
		Remove-Item $fileName_output
	}else{
		Write-Host "ファイルは存在しません。"
	} 

	$i=0
	while (($line = $file_input.ReadLine()) -ne $null) {
		if (-not ([string]::IsNullOrEmpty($line))) {
			if (($line.Contains($Arg4))){
				# Write-Host $i : $line
				$line = $line -replace '\"',""
				$items = $line -split "="
				Write-Host "---------------------"
				Write-Host "置換前:"$items[1]		
				Write-Host "Length: $($items[1].Length)"
				$item1 = $items[1].trim()
				$item1 = $items[1] -replace $Arg4,""   # nameで分割した一つ目を取得
				Write-Host "置換後:"$item1
				Write-Host "Trimmed Length: $($item1.Length)"
				Write-Host "---------------------"
				Write-Host "置換前:"$items[5]		
				Write-Host "Length: $($items[5].Length)"
				$item5 = $items[5].trim()
				$item5 = $items[5] -replace $Arg5,""   # keyで分割した一つ目を取得
				Write-Host "置換後:"$item5
				Write-Host "Trimmed Length: $($item5.Length)"
				Write-Host "---------------------"
				Write-Host "置換前:"$items[6]		
				Write-Host "Length: $($items[6].Length)"
				$item6 = $items[6].trim()
				$item6 = $items[6] -replace $Arg6,""   # valueNameで分割した一つ目を取得
				Write-Host "置換後:"$item6
				Write-Host "Trimmed Length: $($item6.Length)"
				Write-Host "---------------------"
				if (-not ([string]::IsNullOrEmpty($item1))) {
					[string]$result = [string]$i+"," +$item1+","+$item5+","+$item6
					Write-Host($result)                	
					Write-Output $result | Add-Content $fileName_output -Encoding Default
                    # Write-Output $result | Out-File -Append -FilePath $fileName_output -Encoding Default

                    # 説明："Hello", "world" | % { $_; Start-Sleep 10 } | Add-Content Hello.txt
                    # Set-Content:Out-File / Add-Content:Out-File -Appendの違い
				
				}
			}
		}
		$i++
	}

	$file_input.Close()
	# $file_output.Close()
	Write-Host("終了")
}

#endregion


# スタートアップ処理
# -----------------------------
#region startup


	# 変数宣言
	[string[][]]$columns = @()
	[string[]]$column = @()
	[string[]]$arr = @()


	# テキストファイル名の指定
	$var_input_filename="SystemRestore.admx.txt"
	$var_output_filename="SystemRestore.admx_ouput_.txt"
	$var_string_1="class"
	$var_string_2="valueName"
	$var_string_3=">"
	
	$path = Split-Path -Parent $MyInvocation.MyCommand.Path
	# Write-Host($path)
	Set-Location $path
	
    string_replace $path $var_input_filename $var_output_filename $var_string_1 $var_string_2 $var_string_3
    
    # $string=Select-String -Path ($path+"\\SystemRestore.admx.txt") -Pattern "<policy name=" -Context 0, 1 | % { $_.Context.PreContext + $_.Line + $_.Context.PostContext }
    # Write-Host($string)

#endregion
# -----------------------------
