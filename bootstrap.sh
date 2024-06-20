#!/bin/bash

# Function to execute each script in the modules directory
execute_scripts() {
    echo "Executing modules..."
    for script in ./modules/*.sh; do
        script_name=$(basename "$script")
        echo "Executing $script_name..."
        bash "$script"
        if [ $? -ne 0 ]; then
            echo "Error executing $script_name. Exiting."
            exit 1
        fi
    done
}

# Function to link dotfiles using stow
link_dotfiles() {
    echo "Linking dotfiles using stow..."
    stow -v --dotfiles -t ~ dotfiles --adopt
}

# Execute scripts in the modules directory
execute_scripts

# Link dotfiles
link_dotfiles

echo "Bootstrap process completed successfully."