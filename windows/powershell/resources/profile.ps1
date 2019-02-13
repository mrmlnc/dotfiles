$profileModule = Get-Item -Path $PSCommandPath
$profileModuleSymlinkTargetPath = $profileModule.Target

if ($profileModuleSymlinkTargetPath) {
    $profileModule = $profileModuleSymlinkTargetPath
}

[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

$profileRootPath = Split-Path -Parent $profileModule

Import-Module -Name "$profileRootPath\aliases.ps1" -Force
Import-Module -Name "$profileRootPath\cmdlets.ps1" -Force

Import-Module -Name "$profileRootPath\oh-my-posh.ps1" -Force

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward
