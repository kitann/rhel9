#!/bin/bash

# Replace 'finance_group' with the actual group name you want to check
finance_group="finance_group"

# Get users in the group and check their password expiration details
for user in $(getent group $finance_group | cut -d: -f4 | tr ',' ' '); do
    echo "Checking password details for user: $user"
    chage -l $user
done
