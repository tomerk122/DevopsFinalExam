output "tomer_ssh_command" {
  value = "ssh -i tomer-key.pem ubuntu@${aws_instance.vm.public_ip}"
}
