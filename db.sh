#!/bin/bash

# Update the package lists to get the latest package information
sudo apt-get update -y

# Upgrade the installed packages to their latest versions
sudo apt-get upgrade -y

# Import the MongoDB public GPG key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

# Add the MongoDB repository to the package sources list
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

# Update the package lists again to include the MongoDB repository
sudo apt-get update

# Install MongoDB
sudo apt-get install -y mongodb-org

# Start the MongoDB service
sudo systemctl start mongodb

# change the sed to  ip to 0.0.0.0 inside /etc/mongodb.conf
sudo sed -i 's+bind_ip = 127.0.0.1+bind_ip = 0.0.0.0+' /etc/mongodb.conf

# Enable MongoDB to start on system boot
sudo systemctl enable mongodb
sudo systemctl restart mongodb


# cat /var/log/cloud-init-output.log