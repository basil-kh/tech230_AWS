#!/bin/bash

# Update package lists
sudo apt-get update -y

# Upgrade installed packages to their latest versions
sudo apt-get upgrade -y

# Install the Nginx web server
sudo apt-get install nginx -y
#replace tryfiles line with the proxy pass localhost:3000
sed -i 's+try_files $uri $uri/ =404;+proxy_pass http://localhost:3000;'
sudo systemctl restart nginx
sudo systemctl enable nginx

# Install git not needed as its pre installed
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g

echo "export DB_HOST=mognodb://172.31.58.198:27017/posts" >> .bashrc
source .bashrc

git clone https://github.com/basil-kh/app.git

cd /home/ubuntu/app
npm install
pm2 stop app.js
pm2 start app.js --update-env