#�P�ꕪ�̃R�����g�ł��B
<#�����s�� �R�����g�A�E�g�ł��B
#>

#### ----------------------------------------
#### PowerShell �e�L�X�g�t�@�C���̍s���擾����
#### ----------------------------------------

# �e�L�X�g�t�@�C�����̎w��
$var_input_filename="adm_data.txt"
$var_input_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $var_input_filename)
$var_output_filename="adm_data_output.txt"
$var_output_file_path = -Join ("C:\Users\kuma\Desktop\20240622_bat_setlocal\", $var_output_filename)
$var_string_policy="_Policy="
$var_string_explain="_Explain="

# PowerShell�Ńe�L�X�g�t�@�C�����P�s���ǂݍ��ރT���v���R�[�h 

# �ϐ��錾
[string[][]]$columns = @()
[string[]]$column = @()
[string[]]$arr = @()

Remove-Item $var_output_file_path

# �����R�[�h��ύX
$enc = [Text.Encoding]::GetEncoding("UTF-8")
$file_content = New-Object System.IO.StreamReader($var_input_file_path, $enc)
$i=0
while (($line = $file_content.ReadLine()) -ne $null) {
	if (-not ([string]::IsNullOrEmpty($line))) {
		if (( $line.Contains($var_string_policy)) -or ($line.Contains($var_string_explain))){
			# Write-Host $i : $line
			$items = $line -split "="
			$item0 = $items[0] # <policy name=�ŕ���������ڂ��擾
			$item1 = $items[1] # <policy name=�ŕ���������ڂ��擾
			if (-not ([string]::IsNullOrEmpty($item0))) {
				$result = [string]$i + "," + $item0 + "," + $item1
				Write-Host($result)
				$result >> $var_output_file_path
			}
		}
	}
	$i++
}

