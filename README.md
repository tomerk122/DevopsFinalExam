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
  


    
