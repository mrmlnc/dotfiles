Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("ITunes")

choco install itunes
