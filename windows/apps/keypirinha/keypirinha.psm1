$PackageControlUrl = "https://github.com/ueffel/Keypirinha-PackageControl/releases/download/1.0.0/PackageControl.keypirinha-package"

$ResourceConfigDir = Join-Path $PSScriptRoot "resources"
$ApplicationDir = Join-Path $env:APPDATA "Keypirinha"
$ApplicationConfigDir = Join-Path $ApplicationDir "User"
$ApplicationPackageControlDir = Join-Path $ApplicationDir "InstalledPackages"
$ApplicationPackageControlPath = Join-Path $ApplicationPackageControlDir "PackageControl.keypirinha-package"

function Install {
    choco install keypirinha
}

function Configure {
    New-Item -Path $ApplicationConfigDir -ItemType Directory -Force
    New-Item -Path $ApplicationPackageControlDir -ItemType Directory -Force

    CopyDirectoryItems -Path $ResourceConfigDir -Target $ApplicationConfigDir

    NewShortcut -Shortcut "keypirinha" -Target (Get-Command "keypirinha.exe").Path

    DownloadFile -Url $PackageControlUrl -TargetPath $ApplicationPackageControlPath
}
