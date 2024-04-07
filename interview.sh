# Define environment
#!/bin/bash

# Define Group Name
interview_group="interview_group"

# Check if group exists
if ! getent group "$interview_group" > /dev/null; then

	# Output Group does not exist and create one
	echo -e "==========================================="
	echo "$interview_group does not exist!!!"
	echo "Creating $interview_group"
	
	# create the missing group
	groupadd "$interview_group"
	echo "."
	echo ".."
	echo "..."
	echo "$interview_group Created!!!."
	echo -e "============================================"
fi

# Define default shell
default_shell="/bin/bash"

# Define the interviewers from file
interview_users="interview_passwd.txt"

# loop through the names
while IFS= read -r line; do

	# skip empty lines
	[ -z "$line" ] && continue

	first_name=$(echo "$line" | awk '{print $1}')
	last_name=$(echo "$line" | awk '{print $2}')

	# skip entries missing first and last name
	[ -z "$first_name" ] || [ -z "$last_name" ] && continue
	
	useradd -g "$interview_group" -s "$default_shell" -c "$first_name $last_name" -m -d "/home/$first_name" "$first_name"

done < "$interview_users"
