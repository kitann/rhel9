#!/bin/bash

# Replace 'admin_group' with the actual group name you want to check
admin_users="admin.txt"

# Get users in the group and check their password expiration details
while IFS= read -r line; do

	# Remove empty lines
	[ -z "$line" ] && continue
	
	# Retrieve first and last name
	first_name=$(echo "$line" | awk '{print $1}')
	last_name=$(echo "$line" | awk '{print $2}')
	
	# Skip line if it doesn't contain first and last name
	[ -z "$first_name" ] || [ -z "$last_name" ] && continue

	# Get full name
	full_name="$first_name $last_name"
	
	# Print separator line
	echo -e "============================================================================"
    	echo "Checking password details for user: $first_name"
	echo -e "============================================================================"
	chage -l "$first_name"

done < "$admin_users"
