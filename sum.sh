#!/bin/bash

sum=0
count=0

echo "Enter 6 numbers:"

while [ $count -lt 6 ]; do
  read -p "Input number at index $((count + 1)): " number

  # Check if the input is a valid number

  if [[ $number =~ ^-?[0-9]+$ ]]; then

    sum=$((sum + number))  # Add the number to the sum

    count=$((count + 1))   # Increment the count of valid numbers

  else
    echo "Error: Key in numbers only."
  fi
done

echo "The total sum is: $sum"

