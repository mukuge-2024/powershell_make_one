#�P�ꕪ�̃R�����g�ł��B
<#�����s�� �R�����g�A�E�g�ł��B
#>

#### ----------------------------------------
#### PowerShell �e�L�X�g�t�@�C���̍s���擾����
#### ----------------------------------------

# �P�����z���\��
function disp_vector($row)
{
    foreach ($col in $row)
    {
        Write-Host ([String]::Format("{0,14:F10}", $col)) -nonewline
    }
    Write-Host
}

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

# -----------------
# _Policy= �̓��e�𕶎���u��
# -----------------

Write-Host "p�u���O"
disp_vector $column
		
Write-Host "p�u����"
[string[]]$line_p_temp = @()

for ( $index = 0; $index -lt $column.count; $index++)
{
    #"Item: [{0}]" -f $column[$index]
    #Write-Host $column[$index]
	$line_p_temp = $column[$index].split("=")
    $column[$index] = $line_p_temp[1]
}

#Write-Host $column

# $column��z��Ƃ���$columns����
$columns += ,@($column)

$file_content.Close()
# $column����ɂ���
[string[]]$column = @()

Write-Host "p�u��������A$column"
disp_vector $column


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


Write-Host "e�u���O"
disp_vector $column

Write-Host "e�u����"
[string[]]$line_e_temp = @()

for ( $index = 0; $index -lt $column.count; $index++)
{
    "Item: [{0}]" -f $column[$index]
    #Write-Host $column[$index]
	$line_e_temp = $column[$index].split("=")
    $column[$index] = $line_e_temp[1]
}

#Write-Host $column

# �ēx$column��z��Ƃ���$columns����
$columns += ,@($column)


$file_content_e.Close()
# $column����ɂ���
[string[]]$column = @()


# �ȍ~�t�@�C���������J��Ԃ��B
Write-Host ------------------------------------
Write-Host ($columns[0][0] + "," + $columns[1][0])
Write-Host ($columns[0][1] + "," + $columns[1][1])
Write-Host ($columns[0][2] + "," + $columns[1][2])
Write-Host ($columns[0][3] + "," + $columns[1][3])
Write-Host ------------------------------------
$columns[0][0] + "`t" + $columns[1][0] >> _output.txt
$columns[0][1] + "`t" + $columns[1][1] >> _output.txt
$columns[0][2] + "`t" + $columns[1][2] >> _output.txt
$columns[0][3] + "`t" + $columns[1][3] >> _output.txt

# Select-String -Path $var_file_path -Pattern "_Policy="
# Select-String -Path $var_file_path -Pattern "_Explain="

# �I��
Write-Host("�I��")
