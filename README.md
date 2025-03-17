# DevopsFinalExam
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


