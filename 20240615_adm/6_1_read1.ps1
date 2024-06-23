$f = (Get-Content in.txt) -as [string[]]
$i=1
foreach ($l in $f) {
    Write-Host $i : $l
    $i++
}