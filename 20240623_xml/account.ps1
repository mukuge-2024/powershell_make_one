
# --- xmi_file‚ÌŽw’è
[xml]$xml_file = Get-Content ".\account.xml"


# $xml_file.ChildNodes.ChildNodes | ForEach-Object { $_.ChildNodes[1], $_.ChildNodes[0], $_.ChildNodes[2], 
# $_.ChildNodes[3]}| ConvertTo-Csv | Out-File ".\account.csv"

$out = [ordered]@{}

foreach($i in $xml.Objects.Object)
{
	
	foreach($prop in $i.Property)
	{
		Write-Host "========"
		#$Property Name.id
		#$employee.name
		#$employee.year
	    # $out[$prop.Name] = $prop.'#text'
	    $out[$prop.Name] = $prop.'#text'
	    # $myXml.Store.Product[0].Price."#text"
	    
	    Write-Host $out[$prop.Name]
	    Write-Output $out[$prop.Name] | Add-Content ".\account.csv" -Encoding Default
	}
	# [pscustomobject]$out
	# Write-Output $out | Add-Content ".\account.csv" -Encoding Default
    
}

# Write-Output $result | Out-File -FilePath ".\account_all.csv" -Encoding Default
