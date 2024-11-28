#!/bin/bash

# Create the MD5 checksum file for jokes.txt and employees.json
md5sum jokes.txt > MD5SUM
md5sum employees.json >> MD5SUM

# Display the checksum file content
echo "MD5 checksum file 'MD5SUM' has been created:"
cat MD5SUM
