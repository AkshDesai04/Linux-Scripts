set +e
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y
rm google-chrome-stable_current_amd64.deb

echo "Installing LibreOffice..."
sudo apt-get install -y libreoffice

echo "Installing draw.io..."
DRAWIO_LATEST_URL=$(curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest | grep "browser_download_url.*-amd64.deb" | cut -d '"' -f 4)
wget $DRAWIO_LATEST_URL -O drawio.deb
sudo dpkg -i drawio.deb
sudo apt-get install -f -y
rm drawio.deb

echo "Installing Gemini CLI..."
npm install -g @google/gemini-cli

echo "Installing VLC..."
sudo snap install vlc

echo "Installing OBS Studio..."
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt-get update
sudo apt-get install -y obs-studio

echo "Installing Zoom..."
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
sudo apt-get install -f -y
rm zoom_amd64.deb

echo "Installing Slack..."
sudo snap install slack

echo "Installing qBittorrent..."
sudo apt-get install -y qbittorrent