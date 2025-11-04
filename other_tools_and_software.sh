set +e
sudo apt install -y blender

echo "Installing Remmina..."
sudo apt-get install -y remmina

echo "Ensuring SSH client is installed..."
sudo apt-get install -y openssh-client
