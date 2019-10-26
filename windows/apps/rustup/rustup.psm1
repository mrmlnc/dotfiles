$ApplicationUrl = "https://win.rustup.rs/x86_64"
$TemporaryDirectory = NewTemporaryDirectory
$InstallerFile = Join-Path $TemporaryDirectory "rustup-init.exe"

$CargoHomeEnvName = "CARGO_HOME"
$CargoHomeEnvValue = "D:\work\.cargo-cache"

function Skip {
    return IsExistCommand "rustup"
}

function Before {
    DownloadFile -Url $ApplicationUrl -TargetPath $InstallerFile
}

function Install {
    Start-Process -FilePath $InstallerFile -ArgumentList "-y" -Wait -NoNewWindow
}

function After {
    Remove-Item $TemporaryDirectory -Recurse
}

function Configure {
    [System.Environment]::SetEnvironmentVariable($CargoHomeEnvName, $CargoHomeEnvValue, 'Machine')
}
