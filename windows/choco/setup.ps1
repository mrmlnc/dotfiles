Import-Module -Name "$PSScriptRoot\..\utils.ps1" -Force

[Logger]::Install("Choco")

if (Check-Command "choco") {
    choco upgrade chocolatey
}
else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

[Logger]::Setup("Choco Packages")

choco feature enable -n=allowGlobalConfirmation

# Required for `Update-SessionEnvironment`
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1" -Force;

$entries = Get-Item -Path "$PSScriptRoot\*\setup.ps1"

foreach ($entry in $entries) {
    Import-Module -Name $entry -Force
}

choco feature disable -n=allowGlobalConfirmation

[Logger]::Done("Choco Packages")
