set +e
sudo systemctl enable redis-server
sudo systemctl start redis-server

sudo systemctl enable ssh
sudo systemctl start ssh