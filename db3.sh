sudo apt update -y

sudo apt upgrade -y

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

sudo apt install mongodb -y

sudo systemctl start mongodb

sudo sed -i 's+bind_ip = 127.0.0.1+bind_ip = 0.0.0.0+' /etc/mongodb.conf

sudo systemctl restart mongodb

sudo systemctl enable mongodb

