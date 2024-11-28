#!/bin/bash

# Prompt the user to enter the directory path
read -p "Enter the directory path: " dir

# Check if the directory exists
if [[ ! -d "$dir" ]]; then
  echo "Error: The directory '$dir' does not exist."
  exit 1
fi

# Initialize a counter for the number of converted files
converted_count=0

# Find all .jpg files in the directory
for img in "$dir"/*.jpg; do
  # Check if the file exists (in case there are no .jpg files)
  if [[ -f "$img" ]]; then
    # Construct the output file name by changing the extension to .tiff
    output="${img%.jpg}.tiff"
    
    # Convert the image from .jpg to .tiff using the magick command (ImageMagick v7)
    magick "$img" "$output"
    
    # Check if conversion was successful
    if [[ $? -eq 0 ]]; then
      # Increment the counter if the conversion was successful
      ((converted_count++))
    else
      echo "Error: Failed to convert $img."
    fi
  fi
done

# Output the number of images converted
echo "$converted_count images were converted to .tiff format."
