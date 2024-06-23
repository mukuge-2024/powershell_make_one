$string1 = "ペンギン"
$string2 = "くじら"
$string3 = "White Bear"

$joinstr1 = -Join ($string1, $string2)
Write-Output $joinstr1

$joinstr2 = -Join ($string1, $string2, $string3)
Write-Output $joinstr2

$joinstr3 = $string1, $string2, $string3 -Join " と "
Write-Output $joinstr3
