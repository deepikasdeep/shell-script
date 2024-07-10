#!/bin/bash

# Configuration Management Script

# Prompt user for input
read -p "Enter server hostname: " HOSTNAME
read -p "Enter server IP address: " IP_ADDRESS
read -p "Enter domain name: " DOMAIN

# Install necessary packages (for CentOS/RHEL)
echo "Installing packages..."
sudo yum -y update
sudo yum -y install nginx

# Configure nginx (adjust paths as needed)
echo "Configuring nginx..."
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak  # Backup original config
sudo cp nginx.conf /etc/nginx/nginx.conf
sudo sed -i "s/{DOMAIN}/$DOMAIN/g" /etc/nginx/nginx.conf

# Start nginx
echo "Starting nginx..."
sudo systemctl start nginx

# Set up firewall (for CentOS/RHEL)
echo "Configuring firewall..."
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload

# Display setup completion message
echo "Configuration completed for $HOSTNAME ($IP_ADDRESS)"




