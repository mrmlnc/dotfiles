Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("Hyper-V")

powershell.exe -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart"
