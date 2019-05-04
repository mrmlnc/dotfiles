Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Setup("rustup")

$tmp = new-TemporaryDirectory
$installerFile = Join-Path -Path $tmp -ChildPath 'rustup-init.exe'
$url = 'https://win.rustup.rs/x86_64'

Download-File -Url $url -Destination $installerFile

Start-Process -FilePath $installerFile -ArgumentList "-y" -Wait -NoNewWindow

Remove-Item $tmp -Recurse
