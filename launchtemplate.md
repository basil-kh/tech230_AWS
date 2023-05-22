1. Create EC2 instance, as before
2. Populate EC2 using user data, in VM provision script or maunually.
3. Instance state >
![Alt text](imgs/createimage.png)

4. Name and put a approriate description then create image ![Alt text](imgs/naming.png)
5. Click on launch templates, ![Alt text](imgs/launchtemplates.png)
6. Create launch template : ![Alt text](imgs/createlaunchtemp.png)
7. Name the template approriately (include LT at the end of the name to imply its a template)
8. Choose the AMI you made previously, ![Alt text](imgs/amipick.png)
9. Make the instance tpye t2.micro ![Alt text](imgs/t2micro.png)
10. choose the appropriate key-pair ![Alt text](imgs/keypair.png)
11. Select the approriate security group
12. You would put all the commands to run the app in the user data section. Then Create launch template
13. You now have a launch template![Alt text](imgs/doneusertemp.png)
# Auto scaling groups
1. Go to AGS from side dropdown ![Alt text](imgs3/ASG.png)
2. ![Alt text](imgs3/createAGS.png)
3. name appropriately.![Alt text](imgs3/naming.png)
4. Keep defualt VPC and choose appropriate AZs![Alt text](imgs3/AZs.png)
5. Attach to a new load balancer, (applicationa load balancer), (internet-facing) ![Alt text](imgs3/LB.png)
6. name TG appropriately, if too many charcters then write TG instead, ![Alt text](imgs3/namingTG.png), ![Alt text](imgs3/shorterTGname.png)
7. Tick turn on Elastic Load blaancing health checks and next![Alt text](imgs3/healthchecks-Elasticload.png)
8. Configure wanted group size and scaling policies, tick target tracking scaling policy![Alt text](imgs3/groupsize.png)
9. set average CPU and target value 50, or whatever is required.![Alt text](imgs3/scalingpolicy.png)
10. Put "Name" in the key and "tech230-....-HA-SC" (High availablility, Scaleablility) or anything that is linked to the ASG and makes sense and next![Alt text](imgs3/tags.png)
11. Review and we are ready to create the Auto Scaling Group! (ASG) ![Alt text](imgs3/create.png)
12. If created should get prompt![Alt text](imgs3/ASGdone.png)
13. After its made, make sure to access the ASG throguh the load balancer ![Alt text](imgs3/LBlink.png)
14. Use the DNS name link to access the website (do not include (A Record) ) ![Alt text](imgs3/lbDNS.png)