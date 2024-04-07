#!/bin/bash

#file containing users
name_file="interview_passwd.txt"

while IFS= read -r line; do

	# Extract first name as username
	first_name=$(echo "$line" | awk '{print $1}')

	for name in "$first_name"; do
		userdel -r "$name"
	done < "$name_file"
done < "$name_file"
