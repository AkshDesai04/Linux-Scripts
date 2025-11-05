GITHUB_USER="AkshDesai04"
WALLPAPER_PATH="./wallpaper.jpg"
TEMP_PIC_PATH="/tmp/github_profile_pic.png"

echo "Fetching profile picture for '$GITHUB_USER'..."

AVATAR_URL=$(curl -s "https://api.github.com/users/$GITHUB_USER" | grep 'avatar_url' | cut -d '"' -f 4)

if [ -z "$AVATAR_URL" ]; then
    echo "Error: Could not fetch avatar URL for user '$GITHUB_USER'."
    exit 1
fi

echo "Downloading profile picture..."
curl -s -L "$AVATAR_URL" -o "$TEMP_PIC_PATH"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download profile picture."
    exit 1
fi

echo "Setting profile picture..."
dbus-send --system --dest=org.freedesktop.Accounts \
    --type=method_call --print-reply \
    /org/freedesktop/Accounts/User$(id -u) \
    org.freedesktop.Accounts.User.SetIconFile \
    string:"$TEMP_PIC_PATH"

if [ $? -ne 0 ]; then
    echo "Warning: Failed to set profile picture via D-Bus."
    echo "As a fallback, copying to ~/.face (may require login/logout to see)."
    cp "$TEMP_PIC_PATH" "$HOME/.face"
else
    echo "Profile picture set successfully."
fi

rm "$TEMP_PIC_PATH"

echo "Setting wallpaper..."
if [ ! -f "$WALLPAPER_PATH" ]; then
    echo "Error: Wallpaper file not found at $WALLPAPER_PATH"
    echo "Please make sure 'wallpaper.jpg' is in the same directory as this script."
    exit 1
fi

ABS_WALLPAPER_PATH=$(readlink -f "$WALLPAPER_PATH")
WALLPAPER_URI="file://$ABS_WALLPAPER_PATH"

echo "Setting wallpaper to $WALLPAPER_URI"

gsettings set org.gnome.desktop.background picture-uri "$WALLPAPER_URI"
gsettings set org.gnome.desktop.background picture-uri-dark "$WALLPAPER_URI"

gsettings set org.gnome.desktop.background picture-options 'zoomed'

echo "Wallpaper set successfully."
echo "Done."

echo "Setting GNOME Appearance and Dock settings..."

# Set Appearance style to dark mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Set accent color to teal
gsettings set org.gnome.desktop.interface accent-color 'teal'

# Set Ubuntu desktop dock icon size to 32
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

# Set Ubuntu desktop dock panel mode to off
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Set Ubuntu desktop dock auto-hide the dock to on
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

echo "Setting custom keyboard shortcuts..."

# Define custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"

# Super+I to open settings
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Open Settings'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-control-center'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>i'

# Ctrl+Shift+Esc to open system monitor
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Open System Monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'gnome-system-monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Primary><Shift>Escape'

# Super+E to open files
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Open Files'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Super>e'