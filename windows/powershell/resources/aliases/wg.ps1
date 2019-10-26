function SetLocationGitHubWorkDir {
	Set-Location -Path 'D:\work\GitHub'
}

Set-Alias -Name "wg" -Value SetLocationGitHubWorkDir -Description "Go to GitHub directory"
