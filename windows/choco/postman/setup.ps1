Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("Postman")

choco install postman
