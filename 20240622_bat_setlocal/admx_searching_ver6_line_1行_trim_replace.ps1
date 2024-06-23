#�P�ꕪ�̃R�����g�ł��B
<#�����s�� �R�����g�A�E�g�ł��B
#>

#### ----------------------------------------
#### PowerShell �e�L�X�g�t�@�C���̍s���擾����
#### ----------------------------------------

# �e�L�X�g�t�@�C�����̎w��
$var_input_filename="SystemRestore.admx.txt"
$var_input_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $var_input_filename)
$var_output_filename="SystemRestore.admx_ouput.txt"
$var_output_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $var_output_filename)
$var_string_1="<policy name="
$var_string_2="key="

# PowerShell�Ńe�L�X�g�t�@�C�����P�s���ǂݍ��ރT���v���R�[�h 

# �ϐ��錾
[string[][]]$columns = @()
[string[]]$column = @()
[string[]]$arr = @()

if(Test-Path $var_output_file_path){
	# Write-Host "�t�@�C�����폜���܂��B"
	Remove-Item $var_output_file_path
}else{
	Write-Host "�t�@�C���͑��݂��܂���B"
} 

$fileName_output = $var_output_file_path + $var_output_filename
$file_output = New-Object System.IO.StreamWriter($fileName_output, $false, [System.Text.Encoding]::GetEncoding("sjis"))

<#
0: <policy name=
1:  "SR_DisableConfig" class=  �� �K�v
2:  "Machine" displayName=
3:  "$(string.SR_DisableConfig)" explainText=
4:  "$(string.SR_DisableConfig_Help)" key= �� �K�v
5:  "Software\Policies\Microsoft\Windows NT\SystemRestore" valueName= �� �K�v
6:  "DisableConfig">  �� �K�v
#>

function string_replace {
	Param(
        $Arg1,  # ���s����ꍇ�̓J���}��Y�ꂸ��
        $Arg2
    )


}


# �����R�[�h��ύX
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
			Write-Host "�u���O:"$items[1]
			# $item1 = $items[1] -replace "*class","AA"      # name�ŕ���������ڂ��擾
			# $str = "--12345--" -replace "[0-9]{5}", "*****"
			Write-Host "Length: $($items[1].Length)"
			$item1 = $items[1].trim()
			$item1 = $items[1] -replace "class",""   # name�ŕ���������ڂ��擾
			Write-Host "�u����:"$item1
			Write-Host "Trimmed Length: $($item1.Length)"
			$item4 = $items[4].Replace(" key=","")        # explainText�ŕ���������ڂ��擾
			$item5 = $items[5].Replace(" valueName=","")  # key�ŕ���������ڂ��擾
			$item6 = $items[6].Replace("> ","")           # valueName�ŕ���������ڂ��擾
			if (-not ([string]::IsNullOrEmpty($item1))) {
				[string]$result = [string]$i + "," + $item1 + "," + $item4 + "," + $item5 + "," + $item6
				Write-Host($result)
				
				# [string]$result >> $var_output_file_path
				# Set-Content $result
				# Set-Content �t�@�C���p�X ������ -Encoding utf8
				# Write-Output "����������" | Add-Content $var_output_file_path -Encoding Default
				Write-Output $result | Add-Content $var_output_file_path -Encoding Default
			}
		}
	}
	$i++
}

$file_content.close()
$file_output.Close()
Write-Host("�I��")

