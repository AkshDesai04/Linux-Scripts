#!/bin/bash

# This script executes all the setup scripts in a logical order.

set +e

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Execute scripts
"$SCRIPT_DIR/update_and_upgrade.sh"
"$SCRIPT_DIR/linux_tools.sh"
"$SCRIPT_DIR/dev_tools.sh"
"$SCRIPT_DIR/dev_langs_comps.sh"
"$SCRIPT_DIR/user_setup.sh"
"$SCRIPT_DIR/code_ide.sh"
"$SCRIPT_DIR/dev_env.sh"
"$SCRIPT_DIR/dev_cloud_env.sh"
"$SCRIPT_DIR/productivity_tools.sh"
"$SCRIPT_DIR/other_tools_and_software.sh"
"$SCRIPT_DIR/ollama_model_pulls.sh"
"$SCRIPT_DIR/ricing.sh"
"$SCRIPT_DIR/service_startup.sh"
"$SCRIPT_DIR/update_and_upgrade.sh"

echo "All scripts executed successfully!"
echo "Rebooting in 30 secs."

sudo reboot