Glossary:
- VPC - Virtual Private Cloud
- IGW - Internet Gateway
- RT - Route table
![Alt text](imgs-vpc/Diagram-domyown.png)
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

![Alt text](imgs-vpc/9.png)
![Alt text](imgs-vpc/10.png)
![Alt text](imgs-vpc/11-dbaswell.png)

# Create public RT

![Alt text](imgs-vpc/12-route.png)
![Alt text](imgs-vpc/13.png)
![Alt text](imgs-vpc/14.png)
# Link public RT to subnet
![Alt text](imgs-vpc/15.png)
![Alt text](imgs-vpc/16-onlyselect-app(public).png)
![Alt text](imgs-vpc/17.png)

# Link IGW to RT

![Alt text](imgs-vpc/18.png)
![Alt text](imgs-vpc/19.png)
![Alt text](imgs-vpc/20.png)
![Alt text](imgs-vpc/21.png)

# Launching our EC2s
All remains the same as before except our network settings:

![Alt text](imgs-vpc/22-when-creating-instance-only%20part%20to%20change.png)
![Alt text](imgs-vpc/23.png)
![Alt text](imgs-vpc/24.png)
![Alt text](imgs-vpc/25-done.png)
![Alt text](imgs-vpc/26.png)

