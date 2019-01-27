Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("7-zip")

choco install 7zip
