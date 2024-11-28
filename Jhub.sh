#!/bin/bash

# File containing the names and emails of students
students_file="students.txt"

# Template file
template_file="template.txt"

# Check if the necessary files exist
if [[ ! -f "$students_file" || ! -f "$template_file" ]]; then
    echo "Error: Required file(s) not found!"
    exit 1
fi

# Read each line from the students file
while IFS=, read -r name email; do
    # Create the personalized message by replacing {name} with the student's name
    invitation_message=$(sed "s/{name}/$name/" "$template_file")

    # Send the email using `mail` command (assuming `mail` is configured on the system)
    echo "$invitation_message" | mail -s "Invitation to JhubAfrica 21st Open Webinar" "$email"
    
    # Check if the email was sent successfully
    if [[ $? -eq 0 ]]; then
        echo "Invitation sent to $name ($email)"
    else
        echo "Failed to send invitation to $name ($email)"
    fi
done < "$students_file"
