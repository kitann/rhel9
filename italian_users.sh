#!/bin/bash

# define the group
italian_group="italian_group"

# check if group exist
if ! getent group "$italian_group" > /dev/null; then
	echo "The $italian_group does not exist. creating group"

	groupadd "$italian_group"
	echo "The $italian_group is created!!!"
fi

# define default shell
default_shell="/bin/bash"

# define file name
name_file="italian.txt"

while IFS= read -r line; do
	
	# extract first and last name from list
	first_name=$(echo "$line" | awk '{print $1}')
	last_name=$(echo "$line" | awk '{print $2}')
	
	# get full name
	full_name="$first_name $last_name"
	
	# Report user creation
	echo "Creating user: $first_name for $full_name"
	
	# create finance group users from file
	useradd -g "$italian_group" -s "$default_shell" -m -d "/home/$first_name" "$first_name"
	
	# Report completion of user creation
	echo "Created user: $first_name for $full_name"

# Complete the execution and write users to the loop	
done < "$name_file"
