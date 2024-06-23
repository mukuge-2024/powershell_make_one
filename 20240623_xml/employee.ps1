$content = Get-Content "C:\Users\kuma\Desktop\20240623_xml\sample.xml"

$xml = [xml]$content

foreach ($i in $xml.employees.employee){
	Write-Host "-----------"
	Write-Host $employee[$i].id
	Write-Host $employee[$i].name
	Write-Host $employee[$i].year
}

Write-Host "óvëfêî"
Write-Host $xml.employees.employee.Length