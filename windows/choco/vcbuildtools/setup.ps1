Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("Microsoft Visual C++ Build Tools 2015")

choco install vcbuildtools
