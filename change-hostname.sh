#!/bin/bash

# Get the current hostname
current_hostname=$(hostname)

echo "The current hostname is: $current_hostname"
read -p "Do you want to change the hostname? (Y/N): " change_choice

# Convert input to lowercase for consistency
change_choice=$(echo "$change_choice" | tr '[:upper:]' '[:lower:]')

if [[ "$change_choice" == "y" ]]; then
    # Prompt for new hostname
    read -p "Enter the new hostname: " new_hostname
    echo "You entered: $new_hostname"
    read -p "Is this correct? (Y/N): " confirm_choice

    # Convert input to lowercase for consistency
    confirm_choice=$(echo "$confirm_choice" | tr '[:upper:]' '[:lower:]')

    if [[ "$confirm_choice" == "y" ]]; then
        # Change the hostname
        sudo hostnamectl set-hostname "$new_hostname"
        echo "Hostname has been changed to: $new_hostname"
    else
        echo "Hostname change canceled."
    fi
else
    echo "No changes made to the hostname."
fi