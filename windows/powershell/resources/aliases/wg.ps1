function SetLocationGitHubWorkDir {
	Set-Location -Path 'D:\GitHub'
}

Set-Alias -Name "wg" -Value SetLocationGitHubWorkDir -Description "Go to GitHub directory"
