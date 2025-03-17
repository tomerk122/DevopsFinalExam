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

   
   ![image](https://github.com/user-attachments/assets/0f0e070a-b4d9-43d2-adba-9fdfa30cf20a)
   the new image is in docker hub too
   ![image](https://github.com/user-attachments/assets/e0523eb1-d9c2-48ea-aec2-144f2d983709)


  


    
