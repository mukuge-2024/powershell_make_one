#�P�ꕪ�̃R�����g�ł��B
<#�����s�� �R�����g�A�E�g�ł��B
#>

#### ----------------------------------------
#### PowerShell �e�L�X�g�t�@�C���̍s���擾����
#### ----------------------------------------

# �e�L�X�g�t�@�C�����̎w��
#$var_filename="test.txt"
$var_filename="adm_data.txt"
#$var_filename="jp_location.txt"

# $joinstr1 = -Join ($string1, $string2)
# $joinstr1 = $string1 + $string2
# Write-Output $joinstr1

$var_file_path = -Join ("C:\Users\kuma\Desktop\20240615_adm\", $var_filename)
# New-Variable var_filename_p -value "C:\Users\kuma\Desktop\20240615_adm\adm_data.txt"

$var_string="Policy"

#Select-String -Path $var_file_path -Pattern "_Policy="
Select-String -Path $var_file_path -Pattern "_Explain="



# �w��t�@�C���̍ŏ�����X�s�ڂ܂ł��擾����
# Get-Content �e�L�X�g�t�@�C���� | Select-Object -First X
# Get-Content $var_file_path | Select-Object -First 3
# Write-Output =======================
# �w��t�@�C���̍Ōォ���s�ڂ݂̂��擾����
# (Get-Content $var_file_path)[-1]
# Write-Output =======================
# �w��t�@�C���̍Ōォ���s�ڂ݂̂��擾����
# (Get-Content $var_file_path)[-2]
# Write-Output =======================
# �w��t�@�C���̓�s�ڂ���l�s�ڂ܂ł��擾����
# (Get-Content $var_file_path)[0..2]
# Write-Output =======================
# �w��t�@�C����2�s�ڈȍ~���擾����(��s�ڂ��X�L�b�v����)
# Get-Content $var_file_path | Select-Object -Skip 1
# Write-Output =======================