$ApplicationUrl = "https://go.microsoft.com/fwlink/?linkid=2069324&Channel=Dev&language=en-us&Consent=1"
$TemporaryDirectory = NewTemporaryDirectory
$InstallerFile = Join-Path $TemporaryDirectory "MicrosoftEdgeSetup.exe"

function Before {
    DownloadFile -Url $ApplicationUrl -TargetPath $InstallerFile
}

function Install {
    # The `Start-Process` command cannot run this installer in the background
    cmd /c START /WAIT $InstallerFile /silent /install
}

function After {
    Remove-Item $TemporaryDirectory -Recurse
}
