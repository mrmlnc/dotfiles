Import-Module (Join-Path $PSScriptRoot "logger") -Force

function IsExistCommand([string] $Command) {
    return [bool](Get-Command $Command -ErrorAction SilentlyContinue)
}

function DownloadFile($Url, $TargetPath) {
    (New-Object System.Net.WebClient).DownloadFile($Url, $TargetPath)
}

function NewTemporaryDirectory {
    $DirPath = ([System.IO.Path]::GetTempPath() + '~' + ([System.IO.Path]::GetRandomFileName())).Split('.')[0]

    return New-Item -Path $DirPath -ItemType Directory
}

function NewShortcut($Shortcut, $Target) {
    $ShortcutPath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Startup" "$Shortcut.lnk"

    $IsAbsoluteTargetPath = [System.IO.Path]::isPathRooted($Target)
    if ($IsAbsoluteTargetPath) {
        $TargetPath = (Resolve-Path $Target).Path
    }
    else {
        $TargetPath = (Resolve-Path (Join-Path $PSScriptRoot $Target)).Path
    }

    Write-Output "Trying to create shortcut: "$ShortcutPath" -> "$TargetPath""

    $WScriptShell = New-Object -comObject WScript.Shell

    $Shortcut = $WScriptShell.CreateShortcut($ShortcutPath)
    $Shortcut.TargetPath = $TargetPath
    $Shortcut.Save()

    Write-Output "Shortcut was successfully created"
}

function CopyDirectoryItems([string] $Path, [string] $Target) {
    Copy-Item -Path (Join-Path $Path "*") -Destination $Target -Recurse -Force
}

Export-ModuleMember *
