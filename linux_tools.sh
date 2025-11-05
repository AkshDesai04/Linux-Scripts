set +e
echo "--- Installing Linux Tools ---"

sudo apt install -y htop
sudo apt install -y net-tools
sudo apt install -y openssh-server
sudo apt install -y gedit
sudo apt install -y tmux
sudo apt install -y neofetch
sudo apt install -y top
sudo apt install -y iotop

echo "--- Installing lm-sensors ---"
sudo apt install -y lm-sensors
yes | sudo sensors-detect

echo "--- Installing More Linux Tools ---"
sudo apt install -y atop
sudo apt install -y glances
sudo apt install -y powertop
sudo apt install -y ncdu
sudo apt install -y inxi
sudo apt install -y hardinfo
sudo apt install -y stacer
sudo apt install -y bleachbit
sudo apt install -y tree
sudo apt install -y jq
sudo apt install -y xclip
sudo apt install -y ranger
sudo apt install -y mc
sudo apt install -y bat
sudo apt install -y ripgrep
sudo apt install -y fzf
sudo apt install -y silversearcher-ag
sudo apt install -y tldr
sudo apt install -y gparted
sudo apt install -y timeshift
sudo apt install -y btop
sudo apt install -y nmap
sudo apt install -y traceroute
sudo apt install -y duf
sudo apt install -y eza
sudo apt install -y lsd
sudo apt install -y fd-find # on Debian/Ubuntu, binary may be fdfind
sudo apt install -y dnsutils # for dig and nslookup

# On Debian/Ubuntu, the 'bat' binary is sometimes named 'batcat'
# If 'bat' doesn't work, try 'batcat' or create a symlink:
# sudo ln -s /usr/bin/batcat /usr/local/bin/bat