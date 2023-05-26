#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# setup nginx reverse proxy
sudo apt install sed
# $ and / characters must be escaped by putting a backslash before them
sudo sed -i "s/try_files \$uri \$uri\/ =404;/proxy_pass http:\/\/localhost:3000\/;/" /etc/nginx/sites-available/default
# restart nginx to get reverse proxy working
sudo systemctl restart nginx

# install git
sudo apt-get install git -y

# install nodejs
# next line used to be: sudo apt-get install python-software-properties
sudo apt-get install python-software-common
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y


# create global env variable (so app vm can connect to db)
#echo "Setting environment variable DB_HOST..."

#echo "export DB_HOST=mongodb://10.0.22.4:27017/posts" >> ~/.bashrc
#source ~/.bashrc
export DB_HOST=mongodb://10.0.3.226:27017/posts

# clone repo with app folder into folder called 'repo'
git clone https://github.com/daraymonsta/CloudComputingWithAWS repo

# install the app (must be after db vm is finished provisioning)
cd repo/app
npm install

# seed database
echo "Clearing and seeding database..."
node seeds/seed.js
echo "  --> Done!"

# start the app (could also use 'npm start')

# using pm2
# install pm2
sudo npm install pm2 -g
# kill previous app background processes
pm2 kill
# start the app in the background with pm2
pm2 start app.js --update-env