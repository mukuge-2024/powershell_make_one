
#�� PowerShell�œ��{��̕��������𒼂������B
# ��ȕ����R�[�h
# 65001�Futf-8
# 932�Fshift_jis


# chcp   # ���݂̕����R�[�h���m�F
# chcp 65001 # �����R�[�h��ύX
# �p���[�V�F���������čċN��


$var_file_path = "C:\Users\kuma\Desktop\20240615_adm\jp_location.txt"

# Select-String -Path $var_file_path -Pattern "�{"
Select-String "�{" $var_file_path 

# Get-Content $var_file_path | Select-Object -First 3
