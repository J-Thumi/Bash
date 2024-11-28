#!/bin/bash

# Prompt the user to enter the network IP address or subnet
read -p "Enter the network IP address or subnet (e.g., 192.168.1.0/24): " subnet

# Perform a ping sweep on the given subnet to check if hosts are up
echo "Scanning network for hosts attached to $subnet..."

# Use nmap to perform the scan and identify hosts
nmap -sn "$subnet" | grep -B 2 "Host is up" | grep "Nmap scan report" | awk '{print $5, "- Host is up"}'
