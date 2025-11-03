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

# GeminiCLI Desktop (Unofficial, via Snap)
echo "Installing Gemini CLI..."
npm install -g @google/gemini-cli

# VLC
echo "Installing VLC..."
sudo snap install vlc

# OBS Studio
echo "Installing OBS Studio..."
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt-get update
sudo apt-get install -y obs-studio


# Zoom
echo "Installing Zoom..."
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
sudo apt-get install -f -y # Fix dependencies
rm zoom_amd64.deb


# Slack (using Snap)
echo "Installing Slack..."
sudo snap install slack


# qBittorrent
echo "Installing qBittorrent..."
sudo apt-get install -y qbittorrent