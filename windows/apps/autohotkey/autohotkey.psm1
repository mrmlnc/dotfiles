$ResourceConfigPath = (Join-Path $PSScriptRoot "resources" "shortcuts.ahk")

function Install {
    choco install autohotkey
}

function Configure {
    NewShortcut -Shortcut "autohotkey-shortcuts" -Target $ResourceConfigPath
}
