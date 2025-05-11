#!/bin/bash

# Title
echo "🔍 Welcome to Simple Nmap Bash Scanner"

# User Input
read -p "📌 Enter the target IP or domain: " target

# Output File Setup
mkdir -p results
filename="results/${target}_scan.txt"

# Start Scan
echo "📁 Scanning host: $target"
echo "📁 Results will be saved in: $filename"

# Ping Scan
echo -e "\n🔗 Running Ping Scan..." | tee -a $filename
nmap -sn $target | tee -a $filename

# Full Port Scan
echo -e "\n🚪 Running Full Port Scan..." | tee -a $filename
nmap -p- $target | tee -a $filename

# OS Detection and Service Version Scan
echo -e "\n🧠 Running OS Detection and Service Version Scan..." | tee -a $filename
nmap -A $target | tee -a $filename

# Completion Message
echo -e "\n✅ Scan completed. Check the results at: $filename"
