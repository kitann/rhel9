#!/bin/bash

# Replace 'mit_group' with the actual group name you want to check
mit_group="mit_group"

# Get users in the group and check their password expiration details
for user in $(getent group $mit_group | cut -d: -f4 | tr ',' ' '); do
    echo "Checking password details for user: $user"
    chage -l $user
done
