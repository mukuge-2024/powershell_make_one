Import-Module C:\UIAutomation\UIAutomation.0.8.7B3.NET35\UIAutomation.dll
$wndw = Get-UiaWindow -Name '�d��'
$wndw | Get-UiaButton -AutomationId 'num1Button' | Invoke-UiaButtonClick