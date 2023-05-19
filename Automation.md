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
sed -s 's+try_files $uri $uri/ =404;+proxy_pass http://localhost:3000;'
sudo sed -s "s/try_files \$uri \$uri\/ =404;/ 
sudo systemctl restart nginx
```


# 1b. Starting app in background
```bash
#!/bin/bash
#making sure app is not running already, then starting it
cd /home/ubuntu/app
pm2 stop app.js
pm2 start app.js --update-env
```

# 1c. Cloning app file from github

```bash
#!/bin/bash
#Change directory to where you want to have the repo cloned
cd ~
#clone the repo
git clone https://github.com/basil-kh/app.git

```

