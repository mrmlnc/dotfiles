#!/usr/bin/env bash

# Title
echo "Setup NVS"

# Specify the installation path
export NVS_HOME="/usr/local/nvs"

# Set 777 mode
sudo chmod -R 777 $NVS_HOME

# Clone NVS repository
git clone https://github.com/jasongin/nvs "$NVS_HOME"

[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
