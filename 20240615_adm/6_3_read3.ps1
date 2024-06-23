$i=1
foreach ($l in Get-Content in.txt) {
    Write-Host $i : $l
    $i++
}