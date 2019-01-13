Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("SVN")

choco install svn
