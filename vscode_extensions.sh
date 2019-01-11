#!/usr/bin/env bash

# Colors
source $BASEDIR/colors.sh

EXTENSIONS=(
	"alefragnani.bookmarks" \
	"be5invis.vscode-icontheme-nomo-dark" \
	"coenraads.bracket-pair-colorizer-2" \
	"davidanson.vscode-markdownlint" \
	"dbaeumer.vscode-eslint" \
	"editorconfig.editorconfig" \
	"eg2.tslint" \
	"emilast.logfilehighlighter" \
	"github.vscode-pull-request-github" \
	"ipatalas.vscode-postfix-ts" \
	"johnstoncode.svn-scm" \
	"ms-azure-devops.azure-pipelines" \
	"ms-python.python" \
	"ms-vscode.powershell" \
	"oderwat.indent-rainbow" \
	"peterjausovec.vscode-docker" \
	"redhat.vscode-yaml" \
	"rust-lang.rust" \
	"streetsidesoftware.code-spell-checker-russian" \
	"streetsidesoftware.code-spell-checker" \
	"visualstudioexptteam.vscodeintellicode"
)

echo
echo "${YELLOW}Install VS Code extensions${NC}"
if hash "code" 2>/dev/null; then
	for ext in ${EXTENSIONS[@]}; do
		code --install-extension $ext
	done
fi
