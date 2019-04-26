Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("NVS")

choco install nvs

# Update PATH after install git otherwise, we cannot run the commands below
Update-SessionEnvironment

nvs add lts
nvs add latest
