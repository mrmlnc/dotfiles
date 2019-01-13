Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("ConEmu")

choco install conemu
