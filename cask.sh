#!/usr/bin/env bash

# Colors
source $BASEDIR/colors.sh

APPS=(
	# Core
	"spectacle" \
	"flux" \
	"java" \

	# Dev
	"iterm2" \
	"visual-studio-code" \
	"postman" \
	"virtualbox" \
	"docker" \

	# Communications
	"telegram" \
	"slack" \
	"gitify"
)

echo
echo "${YELLOW}Install Apps from Cask...${NC}"
if hash "brew" 2>/dev/null; then
	for app in ${APPS[@]}; do
		brew cask install $app
	done
fi
