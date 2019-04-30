Import-Module -Name "$PSScriptRoot\..\utils.ps1" -Force

[Logger]::Setup("Scripts")

$entries = Get-Item -Path "$PSScriptRoot\*\setup.ps1"

foreach ($entry in $entries) {
    Import-Module -Name $entry -Force
}

[Logger]::Done("Scripts")
