#!/bin/bash

# Prompt for the directory to search
read -p "Enter the directory path: " dir

# Check if the provided directory exists
if [[ ! -d "$dir" ]]; then
  echo "Error: The directory '$dir' does not exist."
  exit 1
fi

# Find all empty directories and output their names and creation times
empty_folders=$(find "$dir" -type d -empty)

# Check if there are empty directories
if [[ -z "$empty_folders" ]]; then
  echo "No empty directories found in '$dir'."
  exit 0
fi

# Count empty directories
count=$(echo "$empty_folders" | wc -l)

# Display the number of empty directories
echo "Number of empty directories: $count"

# Output the empty directories and their creation time
echo "List of empty directories and their creation times:"
for folder in $empty_folders; do
  # Get the creation time of the directory (using stat command)
  creation_time=$(stat --format='%w' "$folder")
  # If creation time is unavailable, use the last modification time
  if [[ "$creation_time" == "-" ]]; then
    creation_time=$(stat --format='%y' "$folder")
  fi
  echo "$folder - Created on: $creation_time"
done

