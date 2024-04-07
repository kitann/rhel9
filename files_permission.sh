#!/bin/bash

# List all files
files=(
	"admin_check_passwd.sh"
	"finance_check_passwd.sh"
	"hr_check_passwd.sh"
	"italian_check_passwd.sh"
	"latino_check_passwd.sh"
	"mit_check_passwd.sh"
	"viet_check_passwd.sh"
)

# Change permissions to execute
for file in "${files[@]}"; do
	chmod +x "$file"
	
	# Report Permission Changed
	echo "EXECUTE Permission given to $file"
	
	# Display files
	ls -ltri "$file"
done
