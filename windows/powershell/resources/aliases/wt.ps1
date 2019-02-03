function SetLocationTextsDir {
	Set-Location -Path 'D:\Texts'
}

Set-Alias -Name "wt" -Value SetLocationTextsDir -Description "Go to Texts directory"
