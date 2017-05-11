#!/usr/bin/env bash

# Title
echo "Setup Consolas font"

source ./.bash_functions

# Install cabextract
brew install cabextract

# Create consolas dir
mkd ~/Downloads/consolas

# Get PowerPointViewer
if [ ! -f ~/Downloads/consolas/PowerPointViewer.exe ]; then
	curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
fi

# Extract consolas font
cabextract PowerPointViewer.exe
cabextract ppviewer.cab

# Open font
sudo cp -R CONSOLA*.TTF ~/Library/Fonts

# Remove cache directory
cd -
rm -rf ~/Downloads/consolas
