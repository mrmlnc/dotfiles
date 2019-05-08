$ResourceConfigDir = Join-Path $PSScriptRoot "resources"
$ApplicationConfigDir = $env:APPDATA

function Install {
    choco install conemu
}

function Configure {
    CopyDirectoryItems -Path $ResourceConfigDir -Target $ApplicationConfigDir
}
