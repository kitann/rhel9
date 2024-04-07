#!/bin/bash

# define the group
finance_group="finance_group"

# check if the group exists
if ! getent group "$finance_group" > /dev/null; then
	echo "The $finance_group does not exist. Creating Group"

	#create the group
	groupadd "$finance_group"
	
	#report group creation
	echo "Group $finance_group created"
	
fi

# define default shell
default_shell="/bin/bash"

# define file name
name_file="finance-users.txt"

while IFS= read -r line; do
	
	# extract first and last name from list
	first_name=$(echo "$line" | awk '{print $1}')
	last_name=$(echo "$line" | awk '{print $2}')
	
	# get full name
	full_name="$first_name $last_name"
	
	# Report the user creation process
	echo "Creating user: $first_name"
	
	# create finance group users from file
	useradd -g "$finance_group" -s "$default_shell" -m -d "/home/$first_name" "$first_name"
	
	# Report the completion of user creation
	echo "Created user: $first_name"
	
# Complete the execution and write users to the loop	
done < "$name_file"
