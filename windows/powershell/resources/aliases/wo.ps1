function SetLocationOpenSourceDir {
    Set-Location -Path 'D:\OpenSource'
}

Set-Alias -Name "wo" -Value SetLocationOpenSourceDir -Description "Go to OpenSource directory"
