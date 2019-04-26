Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("Git")

choco install git

# Update PATH after install git otherwise, we cannot run the commands below
Update-SessionEnvironment

Copy-Item -Path "$PSScriptRoot\resources\.gitconfig" -Destination "~\.gitconfig" -Force -Verbose | Out-Null

$currentGitUser = git config --global --get user.name
$currentGitEmail = git config --global --get user.email

$gitUser = Read-Host -Prompt "Enter your full name ($currentGitUser)"
$gitEmail = Read-Host -Prompt "Enter your e-mail ($currentGitEmail)"

git config --global user.name "$gitUser"
git config --global user.email "$gitEmail"
