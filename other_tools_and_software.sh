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
