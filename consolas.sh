#!/usr/bin/env bash

source ./.bash_functions

# Install cabextract
brew install cabextract

# Go to Downloads dir
cd ~/Downloads

# Create consolas dir
mkd consolas

# Get PowerPointViewer
curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe

# Extract consolas font
cabextract PowerPointViewer.exe
cabextract ppviewer.cab

# Open font
cp -R CONSOLA*.TTF ~/Library/Fonts
