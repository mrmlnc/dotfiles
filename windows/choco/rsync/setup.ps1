Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Setup("rsync")

choco install rsync
