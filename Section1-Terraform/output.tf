output "tomer_ssh_command" {
  value = "ssh -i tomer-key.pem ubuntu@${aws_instance.vm.public_ip}"
}
output "ec2_public_ip" {
  description = "The public IP of the EC2 instance for verification"
  value       = aws_instance.vm.public_ip
}

output "ssh_key_location" {
  description = "The SSH key location for accessing the instance"
  value       = "${path.module}/${local_file.private_key.filename}"
}

output "security_group_id" {
  description = "The security group ID for reference"
  value       = aws_security_group.tomer_sg.id
}