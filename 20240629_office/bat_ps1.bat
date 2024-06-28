

@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

# 文字コードは適宜調整すること
# 元にする PowerShell のコードは行末に ; を付けること
"powershell -NoProfile -ExecutionPolicy Unrestricted -EncodedCommand $([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($(cat .\hello.ps1))))" | Out-File .\base64encoded.bat -Encoding Default