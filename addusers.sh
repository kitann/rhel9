#!/bin/bash

# Group to assign
default_group="employees"

# Default shell
default_shell="/bin/bash"

# File containing list of full names
name_file="new-user.txt"

while IFS= read -r line; do
	# Extract first name from full name
	first_name=$(echo "$line" | awk '{print $1}')

	# Create the users with the first name
	useradd -g "$default_group" -s "$default_shell" -m -d "/home/$first_name" "$first_name" 
done < $name_file
	
