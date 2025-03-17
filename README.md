# DevopsFinalExam

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



