Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("OpenSSH")

choco install openssh -params "/SSHAgentFeature"
