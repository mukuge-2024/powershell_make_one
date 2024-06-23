

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
	$file.WriteLine("aaaaa")
	$file.WriteLine("bbbbb")
	$file.WriteLine("ccccc")
	Write-Host("")
	$file.Close()

	Write-Host("終了")
}

#endregion

# スタートアップ処理
# -----------------------------
#region startup
	$path = Split-Path -Parent $MyInvocation.MyCommand.Path
	Write-Host($path)
	Set-Location $path
	
    txt_read $path "\test.txt"
    txt_write $path "\test2.txt"
#endregion
# -----------------------------