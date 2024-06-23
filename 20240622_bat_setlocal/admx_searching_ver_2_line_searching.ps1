

#region designer



function txt_read {
    Param(
        $Arg1,  # 改行する場合はカンマを忘れずに
        $Arg2
    )
    Write-Host "引数1：$Arg1 引数2：$Arg2"
    
	$fileName = $Arg1 + $Arg2
	$file = New-Object System.IO.StreamReader($fileName, [System.Text.Encoding]::GetEncoding("sjis"))
	while (($line = $file.ReadLine()) -ne $null)
	{
	    Write-Host($line)
	}
	Write-Host("")
	$file.Close()

	Write-Host("終了")
}


function txt_write {
    Param(
        $Arg1,  # 改行する場合はカンマを忘れずに
        $Arg2
    )
    Write-Host "引数1：$Arg1 引数2：$Arg2"

	$fileName = $Arg1 + $Arg2
	$file = New-Object System.IO.StreamWriter($fileName, $false, [System.Text.Encoding]::GetEncoding("sjis"))
	$file.WriteLine("aaaaa" + "," + "bbbbb" + "," + "ccccd")
	Write-Host("")
	$file.Close()

	Write-Host("終了")
}

function txt_searching_output {
    Param(
        $Arg1,  # path
        $Arg2,  # input_filename
        $Arg3   # output_filename
    )
    Write-Host "引数1：$Arg1 引数2：$Arg2 引数3：$Arg3"

	$fileName_input = $Arg1 + $Arg2
	$file_input = New-Object System.IO.StreamReader($fileName_input, [System.Text.Encoding]::GetEncoding("sjis"))
		
	$fileName_output = $Arg1 + $Arg3
	$file_output = New-Object System.IO.StreamWriter($fileName_output, $false, [System.Text.Encoding]::GetEncoding("sjis"))
	
	# foreach ($line in Get-Content -Encoding UTF8 $inputFile) {  # ⇒ 別の検索方法
	while (($line_input = $file_input.ReadLine()) -ne $null)
	{
	    # Write-Host($line_input) # 全部出力
	    # $items = $line_input.split("`t") # タブで分割
	    # <policy name="SR_DisableConfig" class="Machine" displayName="$(string.SR_DisableConfig)" explainText="$(string.SR_DisableConfig_Help)" key="Software\Policies\Microsoft\Windows NT\SystemRestore" valueName="DisableConfig">
	    
	    # Write-Host Select-String -Pattern "^<policy name=" -Path $file_input
	    $items = $line_input.split("name=") # <policy name="で分割
	    $item0 = $items[0] # <policy name=で分割した一つ目を取得
	    $item1 = $items[1] # <policy name=で分割した一つ目を取得
	    # Write-Output "First item: $item0,  second item $item1"
	    if (-not ([string]::IsNullOrEmpty($item0))) {
	    	$result = $item0 + "," + $item1
	    	Write-Host($result)
	    	$file_output.WriteLine($result)
	    }
	}
	
	$file_input.Close()
	$file_output.Close()
	Write-Host("")
	Write-Host("終了")
}



#endregion

# スタートアップ処理
# -----------------------------
#region startup
	$path = Split-Path -Parent $MyInvocation.MyCommand.Path
	Write-Host($path)
	Set-Location $path
	
    # txt_read $path "\SystemRestore.admx.txt"
    # txt_write $path "\SystemRestore.admx_ouput.txt"
    # txt_searching_output $path "\SystemRestore.admx.txt" "\SystemRestore.admx_ouput.txt"
    # $string=Select-String -Path ($path+"\sample.txt") -Pattern "◆" -Context 0, 2 | % { $_.Context.PreContext + $_.Line + $_.Context.PostContext }
    $string=Select-String -Path ($path+"\\SystemRestore.admx.txt") -Pattern "<policy name=" -Context 0, 1 | % { $_.Context.PreContext + $_.Line + $_.Context.PostContext }
    Write-Host($string)
#endregion
# -----------------------------