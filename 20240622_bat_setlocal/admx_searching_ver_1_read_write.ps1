

#region designer

# <policy name="SR_DisableConfig" class="Machine" displayName="$(string.SR_DisableConfig)" explainText="$(string.SR_DisableConfig_Help)" key="Software\Policies\Microsoft\Windows NT\SystemRestore" valueName="DisableConfig">

function txt_read {
    Param(
        $Arg1,  # ���s����ꍇ�̓J���}��Y�ꂸ��
        $Arg2
    )
    Write-Host "����1�F$Arg1 ����2�F$Arg2"
    
	$fileName = $Arg1 + $Arg2
	$file = New-Object System.IO.StreamReader($fileName, [System.Text.Encoding]::GetEncoding("sjis"))
	while (($line = $file.ReadLine()) -ne $null)
	{
	    Write-Host($line)
	}
	Write-Host("")
	$file.Close()

	Write-Host("�I��")
}


function txt_write {
    Param(
        $Arg1,  # ���s����ꍇ�̓J���}��Y�ꂸ��
        $Arg2
    )
    Write-Host "����1�F$Arg1 ����2�F$Arg2"

	$fileName = $Arg1 + $Arg2
	$file = New-Object System.IO.StreamWriter($fileName, $false, [System.Text.Encoding]::GetEncoding("sjis"))
	$file.WriteLine("aaaaa" + "," + "bbbbb" + "," + "ccccd")
	Write-Host("")
	$file.Close()

	Write-Host("�I��")
}

#endregion

# �X�^�[�g�A�b�v����
# -----------------------------
#region startup
	$path = Split-Path -Parent $MyInvocation.MyCommand.Path
	Write-Host($path)
	Set-Location $path
	
    txt_read $path "\SystemRestore.admx.txt"
    txt_write $path "\SystemRestore.admx_ouput.txt"
#endregion
# -----------------------------