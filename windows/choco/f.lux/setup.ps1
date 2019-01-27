Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("f.lux")

choco install f.lux
