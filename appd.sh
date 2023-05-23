#!/bin/bash
cd /home/ubuntu/
# Update package lists t
sudo apt-get update -y

# Upgrade installed packages to their latest versions t
sudo apt-get upgrade -y

sudo apt install sed -y

# Install the Nginx web server t
sudo apt-get install nginx -y
#replace tryfiles line with the proxy pass localhost:3000
sudo sed -i 's+try_files $uri $uri/ =404;+proxy_pass http://localhost:3000/;+' /etc/nginx/sites-available/default
sudo systemctl restart nginx
sudo systemctl enable nginx

# Install git not needed as its pre installed
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g
#not working
echo 'export DB_HOST=mognodb://172.31.58.198:27017/posts' >> .bashrc
source .bashrc

git clone https://github.com/basil-kh/app.git /home/ubuntu/app

cd /home/ubuntu/app
npm install
# if using for first time no need to stop app.js
#pm2 stop app.js 
pm2 start app.js --update-env