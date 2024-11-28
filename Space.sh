#!/bin/bash

# Specify the drive or partition you want to check (e.g., /dev/sda1 or /)
drive="/"

# Get the available space on the specified partition (in MB)
available_space=$(df -m $drive | awk 'NR==2 {print $4}')

# Output the available space
echo "The space available is ${available_space}MB"
