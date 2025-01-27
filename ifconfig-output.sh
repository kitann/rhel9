#!/bin/bash

# Check if sshpass is installed
if ! command -v sshpass &> /dev/null; then
    echo "sshpass is required but not installed. Please install it and try again."
    exit 1
fi

# Prompt for username and IP address
read -p "Enter the username of the host: " username
read -p "Enter the IP address of the host: " ip_address

# Prompt for the password securely
read -s -p "Enter the password: " password
echo

# Run the ifconfig command on the remote host
sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username@$ip_address" \
    "ifconfig" > ifconfig_output.txt

if [ $? -eq 0 ]; then
    echo "ifconfig information has been collected and saved to ifconfig_output.txt."
else
    echo "Failed to connect to the host or collect the ifconfig information."
fi