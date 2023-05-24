#!/bin/bash
cd /home/ubuntu/
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000/;|g' /etc/nginx/sites-available/default
#sudo sed -i 's+# pass PHP scripts to FastCGI server+location /posts {\n\t\tproxy_pass http://localhost:3000/posts;\n\t}+' /etc/nginx/sites-available/default
sudo systemctl restart nginx
sudo systemctl enable nginx
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install pm2 -g
export DB_HOST=mongodb://10.0.3.97:27017/posts

git clone https://github.com/basil-kh/app.git /home/ubuntu/app
sudo systemctl reload nginx
cd /home/ubuntu/app
npm install
node seeds/seed.js
pm2 start app.js --update-env

# cat /var/log/cloud-init-output.log

# sudo killall node
#then restart


