#!/usr/bin/env bash

# Base dir for running script
BASEDIR="$(dirname $0)"

# Colors
source $BASEDIR/colors.sh

echo
echo "${YELLOW}==========================="
echo "========== ${GREEN}Meow! ${YELLOW}=========="
echo "===========================${NC}"
echo

echo "${YELLOW}Configuring brew...${NC}"
source $BASEDIR/brew.sh

CONFIGS=(
	".bash_aliases" \
	".bash_functions" \
	".bash_profile" \
	".bash_powerline" \
	".editorconfig" \
	".gitconfig" \
	".gitignore" \
	".inputrc"
)

echo
echo "${YELLOW}Backup configs...${NC}"
for file in ${CONFIGS[@]}; do
	if [ -f ~/$file ]; then
		mkdir -p ~/configs-backup && cp ~/$file ~/configs-backup/$file

		if [ $? -eq 0 ]; then
			echo "~/$file (${GREEN}backuped${NC})"
		fi
	fi
done
unset file

echo
echo "${YELLOW}Configuring git...${NC}"
CURRENT_GIT_USER=`git config --global --get user.name`
CURRENT_GIT_EMAIL=`git config --global --get user.email`

read -p "Enter your full name (${YELLOW}$CURRENT_GIT_USER${NC}): " GIT_USER
read -p "Enter your e-mail (${YELLOW}$CURRENT_GIT_EMAIL${NC}): " GIT_EMAIL

GIT_USER=${GIT_USER:-$CURRENT_GIT_USER}
GIT_EMAIL=${GIT_EMAIL:-$CURRENT_GIT_EMAIL}

echo
echo "${YELLOW}Copying configs...${NC}"
for file in ${CONFIGS[@]}; do
	cp $BASEDIR/$file ~/$file

	if [ $? -eq 0 ]; then
		echo "~/$file (${GREEN}copied${NC})"
	fi
done
unset file

git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"

echo
echo "${YELLOW}Install applications...${NC}"
source $BASEDIR/cask.sh

echo
echo "${YELLOW}Install some installers...${NC}"
for file in $(ls ./installers); do
	source $BASEDIR/installers/$file
done
unset file

echo
echo "${YELLOW}Configuring VS Code...${NC}"
for file in {locale,settings,keybindings}.json; do
	sudo cp $BASEDIR/.vscode/$file ~/Library/Application\ Support/Code/User/$file

	if [ $? -eq 0 ]; then
		echo ".vscode/$file (${GREEN}copied${NC})"
	fi
done
unset file

# Install VS Code extensions
source $BASEDIR/vscode_extensions.sh

# Reload Bash profile
source ~/.bash_profile

echo
echo "${GREEN}Go to work!${NC}"
echo
