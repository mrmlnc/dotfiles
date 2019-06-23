$profileModule = Get-Item $PSCommandPath
$profileModuleSymlinkTargetPath = $profileModule.Target

if ($profileModuleSymlinkTargetPath) {
    $profileModule = $profileModuleSymlinkTargetPath
}

[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

$env:LC_ALL='C.UTF-8'

$profileRootPath = Split-Path $profileModule

Import-Module "$profileRootPath\aliases.ps1" -Force
Import-Module "$profileRootPath\cmdlets.ps1" -Force

Import-Module "$profileRootPath\oh-my-posh.ps1" -Force

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward
