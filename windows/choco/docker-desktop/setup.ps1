Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("Docker")

choco install docker-desktop
