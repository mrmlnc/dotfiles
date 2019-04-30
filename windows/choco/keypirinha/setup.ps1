Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("Keypirinha")

choco install keypirinha

New-Item -Path "$env:APPDATA\Keypirinha\User" -ItemType Directory -Force -Verbose | Out-Null
Copy-Item -Path "$PSScriptRoot\resources\PackageControl.ini" -Destination "$env:APPDATA\Keypirinha\User\PackageControl.ini" -Force -Verbose | Out-Null
Copy-Item -Path "$PSScriptRoot\resources\Keypirinha.ini" -Destination "$env:APPDATA\Keypirinha\User\Keypirinha.ini" -Force -Verbose | Out-Null
Copy-Item -Path "$PSScriptRoot\resources\Kill.ini" -Destination "$env:APPDATA\Keypirinha\User\Kill.ini" -Force -Verbose | Out-Null

$appPath = (Get-Command keypirinha.exe).Path

Create-Shortcut -Shortcut "keypirinha" -Target $appPath

[Logger]::Install("Keypirinha Package Control")

$url = 'https://github.com/ueffel/Keypirinha-PackageControl/releases/download/1.0.0/PackageControl.keypirinha-package';

Download-File -Url $url -Destination "$env:APPDATA\Keypirinha\InstalledPackages\PackageControl.keypirinha-package"
