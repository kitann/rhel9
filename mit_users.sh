#!/bin/bash

# define the group
mit_group="mit_group"

# check if group exists
if ! getent group "$mit_group" > /dev/null; then
    echo "The $mit_group does not exist. Creating group."
    groupadd "$mit_group"
    echo "The $mit_group is created!!!"
fi

# define default shell
default_shell="/bin/bash"

# define file name
name_file="mit.txt"

while IFS= read -r line; do
    # Skip empty lines
    [ -z "$line" ] && continue

    # extract first and last name from list
    first_name=$(echo "$line" | awk '{print $1}')
    last_name=$(echo "$line" | awk '{print $2}')

    # Skip line if it doesn't contain both first and last name
    [ -z "$first_name" ] || [ -z "$last_name" ] && continue

    # get full name
    full_name="$first_name $last_name"

    # Report user creation
    echo "Creating user: $first_name for $full_name"

    # create finance group users from file
    useradd -g "$mit_group" -s "$default_shell" -m -d "/home/$first_name" "$first_name"

    # Report completion of user creation
    echo "Created user: $first_name for $full_name"

done < "$name_file"
