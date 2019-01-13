function SetLocationHomeDir {
    Set-Location -Path $HOME
}

Set-Alias -Name "home" -Value SetLocationHomeDir -Description "Go to HOME directory"
