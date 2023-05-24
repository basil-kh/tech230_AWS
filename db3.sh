#!/bin/bash

sudo apt update -y

sudo apt upgrade -y

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

sudo apt install mongodb -y

sudo sed -i 's+bind_ip = 127.0.0.1+bind_ip = 0.0.0.0+' /etc/mongodb.conf

sudo sed -i 's+#port = 27017+port = 27017+' /etc/mongodb.conf

sudo systemctl restart mongodb

sudo systemctl enable mongodb

# cat /var/log/cloud-init-output.log

#tech230-basil-mongo-LT (lt-05679c58a0d9f0f20)