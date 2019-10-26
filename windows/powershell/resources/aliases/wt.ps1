function SetLocationTextsDir {
	Set-Location -Path 'D:\work\Texts'
}

Set-Alias -Name "wt" -Value SetLocationTextsDir -Description "Go to Texts directory"
