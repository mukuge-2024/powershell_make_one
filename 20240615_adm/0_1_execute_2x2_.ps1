#�P�ꕪ�̃R�����g�ł��B
<#�����s�� �R�����g�A�E�g�ł��B
#>

#### ----------------------------------------
#### PowerShell �e�L�X�g�t�@�C���̍s���擾����
#### ----------------------------------------

# �e�L�X�g�t�@�C�����̎w��
$var_filename="adm_data_1.txt"
$var_file_path = -Join ("C:\Users\kuma\Desktop\20240615_adm\", $var_filename)
$var_string_policy="_Policy="
$var_string_explain="_Explain="

# PowerShell�Ńe�L�X�g�t�@�C�����P�s���ǂݍ��ރT���v���R�[�h 

# �ϐ��錾
[string[][]]$columns = @()
[string[]]$column = @()


# �����R�[�h��ύX
$enc = [Text.Encoding]::GetEncoding("UTF-8")
$file_content = New-Object System.IO.StreamReader($var_file_path, $enc)



# _Policy= �̓��e��$column�ɗv�f��ǉ����đ��
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
# $column��z��Ƃ���$columns����
$columns += ,@($column)

# $column����ɂ���
[string[]]$column = @()

$file_content_e = New-Object System.IO.StreamReader($var_file_path, $enc)

# _Explain= �̓��e��$column�ɗv�f��ǉ����đ��
# -----------------
while (($line_e = $file_content_e.ReadLine()) -ne $null) {
	#Write-Host $i : $line_e
	if ($line_e.Contains($var_string_explain)){
		#Write-Host $i : $line_e
		$column += $line_e
	}
    $i++
}

# �ēx$column��z��Ƃ���$columns����
$columns += ,@($column)


# $column����ɂ���
[string[]]$column = @()
$file_content_e.Close()

# �ȍ~�t�@�C���������J��Ԃ��B
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
