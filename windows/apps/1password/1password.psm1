$ApplicationUrl = "https://c.1password.com/dist/1P/win6/1PasswordSetup-7.2.617.exe"
$TemporaryDirectory = NewTemporaryDirectory
$InstallerFile = Join-Path $TemporaryDirectory "1password.exe"
$InstallerLogFile = Join-Path $TemporaryDirectory "1password.log"

function Skip {
    return IsInstalledApplication "1password"
}

function Before {
    DownloadFile -Url $ApplicationUrl -TargetPath $InstallerFile
}

function Install {
    $Arguments = @(
        "/VERYSILENT"
        "/NORESTART"
        "/SUPPRESSMSGBOXES"
        "/SP-"
        "/Log=$InstallerLogFile"
    )

    Start-Process -FilePath $InstallerFile -ArgumentList $Arguments -Wait -NoNewWindow -Verbose
}

function After {
    Remove-Item $TemporaryDirectory -Recurse
}
