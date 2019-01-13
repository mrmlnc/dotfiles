Import-Module posh-git
Import-Module oh-my-posh

$ThemeSettings.MyThemesLocation = Join-Path $PSScriptRoot "themes"

Set-Theme -name "Default"
