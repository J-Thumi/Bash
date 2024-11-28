#!/bin/bash

# File to read
file="Angukanayo.txt"

# String to search for
search_string="Mpangale"

# Check if the file exists
if [[ -f "$file" ]]; then
  # Search for the string and display line numbers
  grep -n "$search_string" "$file" > /dev/null 2>&1
  if [[ $? -eq 0 ]]; then
    echo "The string '$search_string' is found in the following lines of '$file':"
    grep -n "$search_string" "$file"
  else
    echo "The string '$search_string' is not found in the file '$file'."
  fi
else
  echo "Error: $file does not exist."
fi

