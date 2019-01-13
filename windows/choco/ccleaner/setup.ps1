Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("CCleaner")

choco install ccleaner
