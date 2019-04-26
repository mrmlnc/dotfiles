Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

[Logger]::Setup("VS Code")

choco install vscode

# Update PATH after install git otherwise, we cannot run the commands below
Update-SessionEnvironment

New-Item -Path "$env:APPDATA\Code\User" -ItemType Directory -Force -Verbose | Out-Null
Copy-Item -Path "$PSScriptRoot\resources\settings.json" -Destination "$env:APPDATA\Code\User\settings.json" -Force -Verbose | Out-Null
Copy-Item -Path "$PSScriptRoot\resources\keybindings.json" -Destination "$env:APPDATA\Code\User\keybindings.json" -Force -Verbose | Out-Null

$extensions = @(
	"alefragnani.bookmarks"
	"be5invis.vscode-icontheme-nomo-dark"
	"coenraads.bracket-pair-colorizer-2"
	"davidanson.vscode-markdownlint"
	"dbaeumer.vscode-eslint"
	"editorconfig.editorconfig"
	"eg2.tslint"
	"emilast.logfilehighlighter"
	"github.vscode-pull-request-github"
	"ipatalas.vscode-postfix-ts"
	"johnstoncode.svn-scm"
	"ms-azure-devops.azure-pipelines"
	"ms-python.python"
	"ms-vscode.powershell"
	"oderwat.indent-rainbow"
	"peterjausovec.vscode-docker"
	"redhat.vscode-yaml"
	"rust-lang.rust"
	"streetsidesoftware.code-spell-checker-russian"
	"streetsidesoftware.code-spell-checker"
	"visualstudioexptteam.vscodeintellicode"
)

foreach ($extension in $extensions) {
	code --install-extension $extension
}
