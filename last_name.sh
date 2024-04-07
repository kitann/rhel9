#!/bin/bash

# The file
name_file="family.txt"

# script to read file
while IFS= read -r line; do

	# Define First and Last Name
	first_name=$(echo "$line" | awk '{print $1}')
	last_name=$(echo "$line" | awk '{print $2}')

	#Define full name
	full_name="$first_name $last_name"
	echo "$last_name is the Last Name for $full_name"
done < "$name_file"
