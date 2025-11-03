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
