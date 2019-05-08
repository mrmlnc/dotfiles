LogProcess "Install PowerShell modules"

Install-Module posh-git -Force -Confirm:$false
Install-Module oh-my-posh -Force -Confirm:$false

LogProcess "Setup PowerShell profile"

$ProfilePath = Join-Path $PSScriptRoot "resources" "profile.ps1"

New-Item $profile -ItemType SymbolicLink -Value $ProfilePath -Force
