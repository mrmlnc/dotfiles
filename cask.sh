#!/usr/bin/env bash

# Colors
source $BASEDIR/colors.sh

APPS=(
	# Core
	"spectacle" \

	# Dev
	"iterm2" \
	"visual-studio-code" \

	# Communications
	"telegram" \
	"slack"
)

echo
echo "${YELLOW}Install Apps from Cask...${NC}"
if hash "brew" 2>/dev/null; then
	for app in ${APPS[@]}; do
		brew cask install $app
	done
fi
