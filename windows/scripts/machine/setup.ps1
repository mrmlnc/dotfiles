Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Setup("Explorer")

# Hide «People» icon on TaskBar
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Name PeopleBand -Value 0

# We can't properly manage visual effects through the registry. Just run the application to configure.
Start-Process C:\windows\system32\SystemPropertiesPerformance.exe -Wait

Stop-Process -Name explorer
