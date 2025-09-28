#!/bin/bash

#================================================================================#
# SCRIPT TO INSTALL A COMPREHENSIVE SET OF DEVELOPMENT & PRODUCTIVITY TOOLS      #
# ON DEBIAN-BASED LINUX SYSTEMS (e.g., UBUNTU)                                   #
#================================================================================#

# --- PRELIMINARIES ---
echo "Updating package lists and upgrading existing packages..."
sudo apt-get update -y

echo "Installing prerequisite packages..."
sudo apt-get install -y curl wget apt-transport-https gnupg-agent software-properties-common snapd

sudo swapoff -a

#================================================================================#
# --- CODING TOOLS ---
#================================================================================#

echo "--- Installing Coding Tools ---"

# Python (Usually pre-installed, this ensures it and its tools are present)
echo "Installing Python and essential tools..."
sudo apt-get install -y python3 python3-pip python3-venv

# PyCharm Community Edition (using Snap)
echo "Installing PyCharm Community..."
sudo snap install pycharm-community --classic

# Visual Studio Code
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get update
sudo apt-get install -y code

# Neovim
sudo apt install -y neovim

# Docker
echo "Installing Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER # Add current user to the docker group

# Redis Setup
sudo apt-get install -y lsb-release curl gpg
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
sudo chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get install -y redis

# Starting the redis server
sudo systemctl enable redis-server
sudo systemctl start redis-server

# Postman (using Snap)
echo "Installing Postman..."
sudo snap install postman

# Ollama
echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Embedding Models
ollama pull embeddinggemma
ollama pull nomic-embed-text
ollama pull mxbai-embed-large

# Reasoning Models
ollama pull deepseek-r1:1.5b
ollama pull deepseek-r1:7b

# Coding Models
ollama pull qwen2.5-coder:3b
ollama pull qwen2.5-coder:7b

# Gemeral Models
ollama pull gemma3:4b
ollama pull gemma3:12b

# AWS CLI
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

# Google Cloud CLI
echo "Installing Google Cloud CLI..."
sudo apt-get install -y google-cloud-sdk

# MySQL Server
echo "Installing MySQL Server..."
sudo apt-get install -y mysql-server

# PostgreSQL & pgAdmin
echo "Installing PostgreSQL and pgAdmin..."
sudo apt-get install -y postgresql postgresql-contrib
# Add pgAdmin repository
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
sudo apt-get update
sudo apt-get install -y pgadmin4

# Gemini CLI (gemma.cpp)
# Note: This requires manual compilation steps. This script will install dependencies.
echo "Installing dependencies for Gemini CLI (gemma.cpp)..."
sudo apt-get install -y g++ cmake
echo "# Gemini CLI (gemma.cpp) requires manual compilation. Please follow the instructions at https://github.com/google/gemma.cpp"

#================================================================================#
# --- PRODUCTIVITY TOOLS ---
#================================================================================#

echo "--- Installing Productivity Tools ---"

# Google Chrome
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y # Fix dependencies
rm google-chrome-stable_current_amd64.deb

# LibreOffice
echo "Installing LibreOffice..."
sudo apt-get install -y libreoffice

# draw.io (diagrams.net)
echo "Installing draw.io..."
# Note: Need to get the latest version from GitHub
DRAWIO_LATEST_URL=$(curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest | grep "browser_download_url.*-amd64.deb" | cut -d '"' -f 4)
wget $DRAWIO_LATEST_URL -O drawio.deb
sudo dpkg -i drawio.deb
sudo apt-get install -f -y # Fix dependencies
rm drawio.deb

# Remmina
echo "Installing Remmina..."
sudo apt-get install -y remmina

# SSH (Client is usually pre-installed)
echo "Ensuring SSH client is installed..."
sudo apt-get install -y openssh-client

# Terminator
sudo apt install -y terminator

# Gemini Desktop (Unofficial, via Snap)
echo "Installing Gemini Desktop..."
sudo snap install gemini-desktop

# ChatGPT
echo "# ChatGPT is a web service and does not have an official desktop client. Access it at https://chat.openai.com/"

# VLC
echo "Installing VLC..."
sudo snap install vlc

# OBS Studio
echo "Installing OBS Studio..."
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt-get update
sudo apt-get install -y obs-studio

# FFmpeg
echo "Installing FFmpeg..."
sudo apt-get install -y ffmpeg

# Wine
echo "Installing Wine..."
sudo apt-get install -y wine64

# Zoom
echo "Installing Zoom..."
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
sudo apt-get install -f -y # Fix dependencies
rm zoom_amd64.deb

# qBittorrent
echo "Installing qBittorrent..."
sudo apt-get install -y qbittorrent

# Blender
sudo apt install blender

# VirtualBox
echo "Installing VirtualBox..."
sudo apt-get install -y virtualbox

#================================================================================#
# --- COMMUNICATION TOOLS ---
#================================================================================#

echo "--- Installing Communication Tools ---"

# Slack (using Snap)
echo "Installing Slack..."
sudo snap install slack

# WhatsApp
echo "# WhatsApp does not have an official native Linux client. You can use the web version at https://web.whatsapp.com/ or an unofficial client."

# Snapchat
echo "# Snapchat is a mobile-only application and not available for desktop."

# Instagram
echo "# Instagram does not have a desktop application. Access it at https://www.instagram.com/"

#================================================================================#
# --- LINUX TOOLS ---
#================================================================================#

echo "--- Installing Linux Tools ---"

# Htop
echo "Installing Htop..."
sudo apt-get install -y htop

# Net-tools for ifconfig
sudo apt install -y net-tools

# Openssh for ssh
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

sudo apt install -y gedit
sudo apt install -y tmux
sudo apt install -y neofetch

#================================================================================#
# --- COMPLETION ---
#================================================================================#

echo "All installations complete!"
echo "NOTE: You may need to log out and log back in for some changes (like the Docker group) to take effect."


######################################################################################
# RICING

# Adding metrics on top bar
# --- Installation ---
echo "Downloading installer script..."
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer

echo "Installing Vitals extension..."
./gnome-shell-extension-installer 1460 --yes

# --- Activation ---
echo "Enabling Vitals extension..."
gnome-extensions enable 'Vitals@CoreCoding.com'

# --- Configuration ---
echo "Configuring Vitals to show desired stats..."
gsettings_path="org.gnome.shell.extensions.vitals"
gsettings set $gsettings_path show-cpu true
gsettings set $gsettings_path show-memory true
gsettings set $gsettings_path show-storage true
gsettings set $gsettings_path show-temperature true
gsettings set $gsettings_path show-disk true
gsettings set $gsettings_path show-net true

# --- Final Step ---
echo "Configuration complete! Restarting GNOME Shell to apply changes..."
sleep 2 # Brief pause before restart
killall -SIGQUIT gnome-shell

echo "Done! Your top bar is now customized."
# Adding metrics on top bar

#

# RICING
######################################################################################



sudo apt update -y
