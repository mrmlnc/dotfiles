Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Setup("1Password")

$tmp = new-TemporaryDirectory
$installerFile = Join-Path -Path $tmp -ChildPath '1password.exe'
$installerLogFile = Join-Path -Path $tmp -ChildPath '1password.log'
$url = 'https://c.1password.com/dist/1P/win6/1PasswordSetup-7.2.617.exe'

Download-File -Url $url -Destination $installerFile

Start-Process -FilePath $installerFile -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /Log=$installerLogFile" -Wait

Remove-Item $tmp -Recurse
