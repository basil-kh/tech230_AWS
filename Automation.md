# Making a bash script in your EC2
1. To make a script on your vm you should make and enter the file: 
```
nano example_script.sh
```
and add your desired bash commands remember to start the file with `#!/bin/bash`, save(`ctrl+s`) and exit(`ctrl+x`).

2. Then make the script executable (to only the owner) using
```
chmod 700 example_script.sh
```
3. To run the script simply, you can run it from any folder by referencing its full path:
```
./clone_repo.sh
```

# 1a. Automate making the reverse proxy: 
```bash
#!/bin/bash
#replacing whatever is in the /etc/nginx/sites-available/default file with the input below to setup the reverse proxy.
sudo bash -c 'cat <<EOF > /etc/nginx/sites-available/default

server {

    listen 80 default_server;

    listen [::]:80 default_server;

    root /var/www/html;

    server_name 192.168.10.100;




    location / {

        proxy_pass http://localhost:3000;

        proxy_http_version 1.1;

        proxy_set_header Upgrade \$http_upgrade;

        proxy_set_header Connection 'upgrade';

        proxy_set_header Host \$host;

        proxy_cache_bypass \$http_upgrade;

    }

    location /posts {

        proxy_pass http://localhost:3000;

        proxy_http_version 1.1;

        proxy_set_header Upgrade \$http_upgrade;

        proxy_set_header Connection 'upgrade';

        proxy_set_header Host \$host;

        proxy_cache_bypass \$http_upgrade;

    }

}

EOF'

sudo systemctl restart nginx
```


# 1b. Starting app in background
```bash
#!/bin/bash
#making sure app is not running already, then starting it
pm2 stop app.js
pm2 start app.js --update-env
```

# 1c. Cloning app file from github

```bash
#!/bin/bash
#Change directory to where you want to have the repo cloned
cd
#clone the repo
git clone git@github.com:basil-kh/app_repo.git

```
