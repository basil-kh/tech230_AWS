1. Create EC2 instance, as before
2. Populate EC2 using user data, in VM provision script or maunually.
3. Instance state >
![Alt text](imgs/createimage.png)

4. Name and put a approriate description then create image ![Alt text](imgs/naming.png)
5. Click on launch templates, ![Alt text](imgs/launchtemplates.png)
6. Create launch template : ![Alt text](imgs/createlaunchtemp.png)
7. Name the template approriately (include TP at the end of the name to imply its a template)
8. Choose the AMI you made previously, ![Alt text](imgs/amipick.png)
9. Make the instance tpye t2.micro ![Alt text](imgs/t2micro.png)
10. choose the appropriate key-pair ![Alt text](imgs/keypair.png)
11. Select the approriate security group
12. You would put all the commands to run the app in the user data section.
13. You now have a launch template![Alt text](imgs/doneusertemp.png)