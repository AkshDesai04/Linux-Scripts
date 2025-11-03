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
sudo apt install -y top
sudo apt install -y iotop