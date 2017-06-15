#!/usr/bin/env bash

# Title
echo "Setup NVS"

# Specify the installation path
export NVS_HOME="/usr/local/nvs"

# Clone NVS repository
sudo git clone https://github.com/jasongin/nvs "$NVS_HOME"

# Set 777 mode
sudo chmod -R 777 $NVS_HOME

[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
