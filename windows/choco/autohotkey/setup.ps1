Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Setup("AutoHotkey")

choco install autohotkey

Create-Shortcut -Shortcut "autohotkey-shortcuts" -Target "$PSScriptRoot\resources\shortcuts.ahk"
