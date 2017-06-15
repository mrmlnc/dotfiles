#!/usr/bin/env bash

# Colors
source $BASEDIR/colors.sh

EXTENSIONS=(
	"CoenraadS.bracket-pair-colorizer" \
	"EditorConfig.EditorConfig" \
	"PeterJausovec.vscode-docker" \
	"akamud.vscode-javascript-snippet-pack" \
	"be5invis.vscode-icontheme-nomo-dark" \
	"dbaeumer.vscode-eslint" \
	"donjayamanne.githistory" \
	"donjayamanne.python" \
	"eg2.tslint" \
	"emilast.LogFileHighlighter" \
	"mkxml.vscode-filesize" \
	"mrmlnc.vscode-duplicate" \
	"oderwat.indent-rainbow" \
	"pprice.better-merge" \
	"progre.promise-snippets" \
	"sysoev.vscode-open-in-github" \
	"patrys.vscode-code-outline"
)

echo
echo "${YELLOW}Install VS Code extensions${NC}"
if hash "code" 2>/dev/null; then
	for ext in ${EXTENSIONS[@]}; do
		code --install-extension $ext
	done
fi
