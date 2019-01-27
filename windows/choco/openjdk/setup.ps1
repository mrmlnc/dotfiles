Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("OpenJDK")

choco install openjdk
