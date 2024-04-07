#!/bin/bash

# Replace 'viet_group' with the actual group name you want to check
viet_group="viet_group"

# Get users in the group and check their password expiration details
for user in $(getent group $viet_group | cut -d: -f4 | tr ',' ' '); do
    echo "Checking password details for user: $user"
    chage -l $user
done
