#!/bin/bash

# Prompt for the user's UID
read -p "Enter the user's UID: " uid

# Get the username associated with the UID
username=$(getent passwd "$uid" | cut -d: -f1)

# Check if the UID exists in the system
if [[ -z "$username" ]]; then
  echo "Error: No user found with UID $uid."
  exit 1
fi

# Use the `who` command to find login information
login_info=$(who | grep -w "$username")

if [[ -z "$login_info" ]]; then
  echo "User '$username' (UID: $uid) is not currently logged in."
else
  # Count the number of login sessions
  login_count=$(echo "$login_info" | wc -l)
  
  echo "User '$username' (UID: $uid) is logged in $login_count times."
  echo "Login times:"
  
  # Display the login times
  echo "$login_info" | awk '{print $4, $5}'  # Extracts login time and date
fi

