#!/bin/bash

# Check if required files exist
if [[ ! -f "students.txt" || ! -f "invitation.txt" ]]; then
  echo "Required files (students.txt and invitation.txt) not found!"
  exit 1
fi

# Loop through each line in the students list
while IFS=" " read -r name email; do
  # Create a personalized email body by replacing [NAME] in the invitation template
  email_body=$(sed "s/\[NAME\]/$name/" invitation.txt)

  # Send the email using Mutt
  echo "$email_body" | mutt -s "Invitation to 21st Open Webinar" -e "set from=josphatthumi03@gmail.com" "$email"
  
  echo "Invitation sent to $name <$email>"
done < students.txt
