# Determine Script Path
$Path = Split-Path $MyInvocation.MyCommand.Path
Write-Host($Path)

$path = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host($path)
 
# Determine Script Drive
$Drive = (Get-Item $Path).Root.Name
Write-Host($Drive)

