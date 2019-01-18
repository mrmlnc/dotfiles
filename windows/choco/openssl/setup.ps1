Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Install("OpenSSL")

choco install openssl.light
