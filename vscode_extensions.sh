#!/usr/bin/env bash

# Colors
source $BASEDIR/colors.sh

EXTENSIONS=(
	"CoenraadS.bracket-pair-colorizer" \
	"PeterJausovec.vscode-docker" \
	"joelday.docthis" \
	"EditorConfig.EditorConfig" \
	"dbaeumer.vscode-eslint" \
	"oderwat.indent-rainbow" \
	"akamud.vscode-javascript-snippet-pack" \
	"emilast.LogFileHighlighter" \
	"be5invis.vscode-icontheme-nomo-dark" \
	"progre.promise-snippets" \
	"donjayamanne.python" \
	"eg2.tslint" \
	"mkxml.vscode-filesize" \
	"mrmlnc.vscode-duplicate" \
	"mrmlnc.vscode-lebab"
)

echo
echo "${YELLOW}Install VS Code extensions${NC}"
if hash "code" 2>/dev/null; then
	for ext in ${EXTENSIONS[@]}; do
		code --install-extension $ext
	done
fi
