#!/bin/bash

# define the group
finance_group="finance_group"

# define default shell
default_shell="/bin/bash"

# define file name
name_file="finance.txt"

while IFS= read -r line; do
	
	# Skip empty lines 
	[ -z "$line" ] && continue

	# extract first and last name from list
	first_name=$(echo "$line" | awk '{print $1}')
	last_name=$(echo "$line" | awk '{print $2}')
	
	# Skip line if it doesn't contain first and last name
   	[ -z "$first_name" ] || [ -z "$last_name" ] && continue

	# get full name
	full_name="$first_name $last_name"
	
	# create finance group users from file
	chage -m 5 -M 90 -W 14 -I 2 "$first_name"
	# Report completion of user creation
	echo "$first_name Password Parameters Set"

# Complete the execution and write users to the loop	
done < "$name_file"
