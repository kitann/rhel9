#!/bin/bash

# Replace 'latino_group' with the actual group name you want to check
latino_group="latino_group"

# Get users in the group and check their password expiration details
for user in $(getent group $latino_group | cut -d: -f4 | tr ',' ' '); do
    echo "Checking password details for user: $user"
    chage -l $user
done
