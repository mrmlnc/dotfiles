Import-Module -Name "$PSScriptRoot\..\utils.ps1" -Force

[Logger]::Install("PowerShell Modules")

Install-Module posh-git -Verbose
Install-Module oh-my-posh -Verbose

[Logger]::Done("PowerShell Modules")

[Logger]::Setup("PowerShell")

New-Item -Path $profile -ItemType SymbolicLink -Value "$PSScriptRoot\resources\profile.ps1" -Force -Verbose | Out-Null

[Logger]::Done("PowerShell")

