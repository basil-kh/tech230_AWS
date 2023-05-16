# Getting a EC2 instance up

1. Login to AWS and you should be on your dashboard:
![Alt text](imgs2/dashboard.png)

2. Search and click on EC2 in the search bar:
![Alt text](imgs2/openec2.png)

3. Click on Launch instance![Alt text](imgs2/launchins.png)
4. Use the naming convention `tech230_<your name>_instance desc_<instance type>` for example `tech230_basil_first_ec2`
   s![Alt text](imgs2/name.png)
5. Pick the `ubuntu` system and specifically the `20.04 version`:![Alt text](imgs2/servertype.png)
6. Make sure the instance tpye is `t2.micro` this should be the default: ![Alt text](imgs2/micro.png)
7. pick the `tech230` rsa key pair name : ![Alt text](imgs2/tech230key.png)
8. Edit the security group:![Alt text](imgs2/editsec.png)
8.1. Name the security group using the appropriate naming convention as before and add an appropriate description ![Alt text](imgs2/secgroupnaming.png)


9. Make sure your summary looks like this then we can click on Launch instance: ![Alt text](imgs2/launch.png)
This should appear if all goes well: ![Alt text](imgs2/success.png)

10. now click on instances: ![Alt text](imgs2/instancesclick.png)
11. On the page type `instance state = running` and press `enter` to add this filter, so its easy to find your new instance, and wait abit as the instance initializes, you can click the circled refresh button to see updated status. When your instance has succeeded in its checks its will show the running state and we we will be ready to move on to the next step ![Alt text](imgs2/instancecheck.png)
12. Once instance state is running we can click the associated instance ID link:![Alt text](imgs2/idlink.png)
13. You will be taken to this page click on connect:![Alt text](imgs2/instancesummaryconnect.png)
14. You will now see this page: ![Alt text](imgs2/connect.png)
You will need to open your bash terminal and make sure you are in you .ssh directory and then type the command 
```bash
chmod 400 tech230.pem
```
followed by 
```bash
ec2-54-77-48-41.eu-west-1.compute.amazonaws.com
```
then we input commands we previously used :
```bash
sudo apt update -y
```

```bash
sudo apt upgrade -y
```
>note: using apt not apt-get since its a newer version of linux
![Alt text](imgs2/linux1.png)

```bash
sudo apt install nginx
```
```bash
sudo systemctl start nginx
```
```bash
sudo systemctl enable nginx
```
15. Go to the security tab in the summary page and click on the security groups linkS
![Alt text](imgs2/secgroupslink.png)
then click on
![Alt text](imgs2/editimbound.png)
then add rule:
![Alt text](imgs2/addrules.png)
then add the http and https with `0.0.0.0/0` ips so anyone can access them for now and click save![Alt text](imgs2/httpandsave.png)
16. Should be able to access the nginx website now using the public IPv4 address found on the instance summary page: ![Alt text](imgs2/ip.png)
17. Should see the nginx website when you click the link: ![Alt text](imgs2/nginx.png)