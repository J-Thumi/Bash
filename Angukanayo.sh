#!/bin/bash

# File to read

file="Angukanayo.txt"

# Check if the file exists
if [[ -f "$file" ]]; then

  # Count characters including spaces using wc -m

  characters=$(wc -m < "$file")
  echo "The file '$file' has $characters characters (including spaces)."
else
  echo "Error: $file does not exist."
fi

