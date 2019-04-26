#Requires -RunAsAdministrator

Import-Module -Name .\utils.ps1 -Force

if ($PSVersionTable.PSVersion.Major -lt 6) {
    Write-Output "Requires PowerShell 6."

    exit
}

[Logger]::Setup("Machine")

Import-Module -Name .\powershell\setup.ps1 -Force
Import-Module -Name .\choco\setup.ps1 -Force

[Logger]::Done("Machine")
