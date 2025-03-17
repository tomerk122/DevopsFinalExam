# DevopsFinalExam

in this section we are creating the DockerHub Cred in the Varibles in the Azure.
After that we are doing the sec and lint to check out ccode (i dont forget to do CD)
then we build, and after that we push it.

![image](https://github.com/user-attachments/assets/f47b14d6-a53e-4306-8dc8-d177e96cf8e5)

![image](https://github.com/user-attachments/assets/c95bcbd4-8c9f-43ff-a504-5112ee8f1844)


the most importnt thing here to remember that in the docker file the app is on 5001

so! 
Lb (getting port 80) -- > out to the deployments that listeneting to port 5001

Lb : (with the right image after fixing it.)
![image](https://github.com/user-attachments/assets/aa6d670f-dd32-4ff4-9ed4-98807d94d29e)

---

in the helm section we took the values out and put it outside.

helm deployments and svc : 
![image](https://github.com/user-attachments/assets/506ea819-ff52-4f1f-8035-2c16b58c97ce)

![image](https://github.com/user-attachments/assets/d47bc1b9-7d1c-4cab-9050-fd1b85f9d0e3)


# in the second build we are copying the dependencies from the first build to the second build
# if we want to test it localy, we can run those commands:
# docker build -t my-python-app .
# docker run -p 5001:5001 my-python-app

our application is not fix yet so we get an error in the section 3, debug we will fix it.
we  uploaded it so we can use it in the ec2: 
![image](https://github.com/user-attachments/assets/5060d529-f165-4fb4-a6cd-7f8c05bbd83f)


 in this pipeline we do some paralizim checks: 
 like Hadolint, Bandit, Trivy

 the Hand is checking the dockerfile - layers, safe image etc.. 
 the bandit is for Security Issues in our code.
 the trivy is for continaer secutiry, Vulnerabilities and etc. 

 pipe line - 
 ![image](https://github.com/user-attachments/assets/55ed7e69-f7e0-4516-b46f-e733b123380e)


the image is in the docker hub:
![image](https://github.com/user-attachments/assets/9f37a379-5056-4892-968b-093237beb753)


the EC2 that we created :
![image](https://github.com/user-attachments/assets/3b062b73-ad21-4aa5-9c1c-2f22c8627861)

in this section we are downlding with a script the DOCKER COMPOSE
after dowloading ( i did that with remote-exec
so after doing that checking:
![image](https://github.com/user-attachments/assets/4f215413-b3b1-4b29-b248-559f4f29e5e6)





for running the proejct first apply 
terraform init, 

then 

terraform plan

then 

terraform apply. 



  '''
   the bug is in this section, we forgot to declar the vpc, lbs, aim.
   also the aims need to be by the owner
   '''

    
    **vpcs= ec2_client.describe_vpcs()** was missing

   vpc_data = [{"VPC ID": vpc["VpcId"], "CIDR": vpc["CidrBlock"]} for vpc in vpcs["Vpcs"]]
  
  
   **lbs = elb_client.describe_load_balancers()** was missing

   lb_data = [{"LB Name": lb["LoadBalancerName"], "DNS Name": lb["DNSName"]} for lb in lbs["LoadBalancers"]]
  
   # Fetch AMIs (only owned by the account)
  ** amis = ec2_client.describe_images(Owners=["self"])  ** was missing
   ami_data = [{"AMI ID": ami["ImageId"], "Name": ami.get("Name", "N/A")} for ami in amis["Images"]]
  

now our appllication loads well :
    ![image](https://github.com/user-attachments/assets/6a8a39dc-8687-4702-a5d2-03a2bc683e9b)
    we also upload the right image:
    ![image](https://github.com/user-attachments/assets/980c1b67-9576-4faf-98b9-342d2bd43576)





