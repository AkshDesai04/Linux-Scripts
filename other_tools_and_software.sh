set +e
sudo apt install -y blender

echo "Installing Remmina..."
sudo apt-get install -y remmina

echo "Ensuring SSH client is installed..."
sudo apt-get install -y openssh-client

echo "Installing Anydesk..."
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install -y anydesk

echo "--- Installing More Tools and Software ---"
sudo apt install -y filezilla
sudo apt install -y gimp
sudo apt install -y kdenlive
sudo apt install -y inkscape
sudo apt install -y audacity
sudo apt install -y transmission
sudo apt install -y calibre
sudo apt install -y nmap
sudo apt install -y wireshark
sudo apt install -y mtr
sudo apt install -y speedtest-cli
sudo apt install -y iftop
sudo apt install -y nethogs
