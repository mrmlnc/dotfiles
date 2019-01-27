Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Setup("XMind")

choco install xmind
