
#■ PowerShellで日本語の文字化けを直したい。
# 主な文字コード
# 65001：utf-8
# 932：shift_jis


# chcp   # 現在の文字コードを確認
# chcp 65001 # 文字コードを変更
# パワーシェルを一回閉じて再起動


$var_file_path = "C:\Users\kuma\Desktop\20240615_adm\jp_location.txt"

# Select-String -Path $var_file_path -Pattern "府"
Select-String "府" $var_file_path 

# Get-Content $var_file_path | Select-Object -First 3
