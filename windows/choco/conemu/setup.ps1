Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("ConEmu")

choco install conemu

Copy-Item -Path "$PSScriptRoot\resources\ConEmu.xml" -Destination "$env:APPDATA\ConEmu.xml" -Force -Verbose | Out-Null
