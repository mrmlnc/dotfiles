Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("NVS")

choco install nvs

nvs add lts
nvs add latest
