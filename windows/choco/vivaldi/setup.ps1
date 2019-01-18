Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("Vivaldi")

choco install vivaldi
