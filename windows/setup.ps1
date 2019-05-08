#Requires -RunAsAdministrator

if ($PSVersionTable.PSVersion.Major -lt 6) {
    Write-Output "Requires PowerShell 6"

    exit
}

Import-Module (Join-Path $PSScriptRoot "utils" "logger") -Force
Import-Module (Join-Path $PSScriptRoot "utils" "common") -Force

LogProcess "Preparing to setup"

if (IsExistCommand "choco") {
    choco upgrade chocolatey
}
else {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco upgrade chocolatey-core.extension

Import-Module (Join-Path $PSScriptRoot "utils" "choco") -Force

LogProcess "Setup machine"

Import-Module (Join-Path $PSScriptRoot "apps" "setup.ps1") -Force
Import-Module (Join-Path $PSScriptRoot "powershell" "setup.ps1") -Force
Import-Module (Join-Path $PSScriptRoot "tweaks" "setup.ps1") -Force
