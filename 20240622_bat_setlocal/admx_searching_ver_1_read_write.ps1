

#region designer

# <policy name="SR_DisableConfig" class="Machine" displayName="$(string.SR_DisableConfig)" explainText="$(string.SR_DisableConfig_Help)" key="Software\Policies\Microsoft\Windows NT\SystemRestore" valueName="DisableConfig">

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

#endregion

# スタートアップ処理
# -----------------------------
#region startup
	$path = Split-Path -Parent $MyInvocation.MyCommand.Path
	Write-Host($path)
	Set-Location $path
	
    txt_read $path "\SystemRestore.admx.txt"
    txt_write $path "\SystemRestore.admx_ouput.txt"
#endregion
# -----------------------------