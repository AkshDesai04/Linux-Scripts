# GEMINI.md

## Project Overview

This project consists of a collection of shell scripts designed to automate the setup of a complete Linux development environment. The scripts are modular, with each script dedicated to a specific category of tools or configurations. A central `main.sh` script orchestrates the execution of all other scripts in a predefined order to ensure dependencies are met and the environment is set up correctly.

The primary goal of this project is to provide a quick and repeatable way to provision a new Linux machine with a comprehensive set of development tools, programming languages, IDEs, and other essential software.

## Building and Running

The project is intended to be run directly from the shell. The `main.sh` script is the main entry point for execution.

To run the entire setup process, execute the following command from the root of the project directory:

```bash
chmod +x main.sh && ./main.sh
```

The `main.sh` script will then execute the following scripts in order:

*   `update_and_upgrade.sh`: Updates and upgrades the system's package repositories.
*   `linux_tools.sh`: Installs essential Linux command-line tools.
*   `dev_tools.sh`: Installs common development tools like Git, curl, and build-essentials.
*   `dev_langs_comps.sh`: Installs various programming languages and compilers.
*   `user_setup.sh`: Configures the user's profile, including setting the profile picture from GitHub and the desktop wallpaper.
*   `code_ide.sh`: Installs code editors and IDEs like Visual Studio Code and PyCharm.
*   `dev_env.sh`: Sets up the development environment with tools like Docker, Redis, and PostgreSQL.
*   `dev_cloud_env.sh`: Installs cloud-related command-line interfaces (CLIs) like the AWS CLI and Google Cloud SDK.
*   `productivity_tools.sh`: Installs productivity-related software.
*   `other_tools_and_software.sh`: Installs other miscellaneous software.
*   `ollama_model_pulls.sh`: Pulls models for Ollama.
*   `ricing.sh`: Placeholder for ricing/customization scripts.
*   `service_startup.sh`: Placeholder for scripts that start services.

## Development Conventions

The following conventions are used throughout the project:

*   **Error Handling:** Each script begins with `set +e`. This ensures that the script will continue to execute even if a particular command fails. This is a deliberate choice to prevent a single failed installation from halting the entire setup process.
*   **Modularity:** The scripts are broken down into logical units based on their function. This makes it easy to maintain and modify specific parts of the setup process.
*   **User Feedback:** The scripts use `echo` statements to provide clear and concise feedback to the user, indicating which installations or configurations are currently in progress.
*   **Execution Order:** The `main.sh` script defines a specific execution order to handle dependencies between scripts. For example, the package repositories are updated before any new software is installed.
