set +e
echo "--- Installing Linux Tools ---"
sudo apt-get install -y htop net-tools openssh-server gedit tmux neofetch top iotop
sudo systemctl enable ssh
sudo systemctl start ssh