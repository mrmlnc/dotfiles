class Logger {
    static Install($Name) {
        Write-Host "==> Install $Name"
    }

    static Uninstall($Name) {
        Write-Host "==> Uninstall $Name"
    }

    static Setup($Name) {
        Write-Host "==> Setup $Name"
    }

    static Done($Name) {
        Write-Host "==> Done $Name"
    }
}

function Check-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

function Create-Shortcut($Shortcut, $Target) {
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
