$i=1
$txt = "c:\work\in.txt"
$enc = [Text.Encoding]::GetEncoding("Shift_JIS")
$fh = New-Object System.IO.StreamReader($txt, $enc)
while (($l = $fh.ReadLine()) -ne $null) {
    Write-Host $i : $l
    $i++
}
