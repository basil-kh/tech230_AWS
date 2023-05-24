Glossary:
- VPC - Virtual Private Cloud
- IGW - Internet Gateway
- RT - Route table
- ![Alt text](imgs-vpc/Internet%20Gateway%20(1).png)


# Create a VPC
1. ![Alt text](imgs-vpc/1.png)
2. ![Alt text](imgs-vpc/2.png)
3. ![Alt text](imgs-vpc/3.png)
4. ![Alt text](imgs-vpc/4.png)
![Alt text](imgs-vpc/5.png)

# Create IGW
1. ![Alt text](imgs-vpc/6.png)

# Connect IGW to VPC
2. ![Alt text](imgs-vpc/7.png)
![Alt text](imgs-vpc/8.png)

# Create subnet/s
## Create 2 subnets - one for the app, other for the DB
![Alt text](imgs-vpc/9.png)
![Alt text](imgs-vpc/10.png)
![Alt text](imgs-vpc/11-dbaswell.png)

# Create public RT
## Change the name of the main RT to private for ease of reference
![Alt text](imgs-vpc/12-route.png)
![Alt text](imgs-vpc/13.png)
![Alt text](imgs-vpc/14.png)
# Link public RT to subnet

## Link both public and private RT to their respective subnet
![Alt text](imgs-vpc/15.png)
![Alt text](imgs-vpc/16-onlyselect-app(public).png)
![Alt text](imgs-vpc/17.png)

# Link IGW to RT
## Link IGW to only the public RT
![Alt text](imgs-vpc/18.png)
![Alt text](imgs-vpc/19.png)
![Alt text](imgs-vpc/20.png)
![Alt text](imgs-vpc/21.png)

# Launching our EC2s
All remains the same as before except our network settings and security groups:

## For the DB(run first):
1. Make sure you are on the correct vpc and subnet(private)
2. Enable auto-assign public IP
3. Make a security group that allows SSH(22) to your IP
- SSH(22) to your IP
- port(27017) from anywhere(so the app can access the db)
- use user data and provision script - to automatically get it up

  ![Alt text](imgs-vpc/27-mongosecurity.png)
## For the app(run after db):
1. Make sure you are on the correct vpc and subnet(public)
2. Enable auto-assign public IP
3. Make a security group that allows SSH(22) to your IP
- SSH(22) to your IP
- HTTP(80) from anywhere (0.0.0.0)
- port(3000) from anywhere(incase reverse proxy doesnt work)
1. make sure db is running already - **Manually** get the private IP from the DB EC2 page and add to **user data** environment variable DB_HOST.
2. use the **edited** user data and the provision script the get the app running automatically
![Alt text](imgs-vpc/28-appsecur.png)

![Alt text](imgs-vpc/22-when-creating-instance-only%20part%20to%20change.png)
![Alt text](imgs-vpc/23.png)
![Alt text](imgs-vpc/24.png)
![Alt text](imgs-vpc/25-done.png)
# Posts page should be working (on ubuntu 18 it took over 10 minutes to load) : 
![Alt text](imgs-vpc/29-postsworking.png)