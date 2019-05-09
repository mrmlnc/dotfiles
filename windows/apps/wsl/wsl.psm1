$DistroUrl = "https://aka.ms/wsl-ubuntu-1804"
$TemporaryDirectory = NewTemporaryDirectory
$InstallerFile = Join-Path $TemporaryDirectory "ubuntu-1804.appx"

function Skip {
    return IsExistCommand "wsl"
}

function Before {
    DownloadFile -Url $DistroUrl -TargetPath $InstallerFile
}

function Install {
    powershell.exe -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart"

    Add-AppxPackage -Path $InstallerFile
}

function After {
    Remove-Item $TemporaryDirectory -Recurse
}
