Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Setup("SysInternals")

choco install sysinternals
