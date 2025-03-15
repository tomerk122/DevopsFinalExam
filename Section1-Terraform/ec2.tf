resource "aws_instance" "vm" {
  ami                    = "ami-04b70fa74e45c3917" # Ubuntu 22.04 LTS AMI
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.aws_key.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.tomer_sg.id]

  tags = {
    Name = "tomer-vm"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y docker.io",
      "sudo systemctl start docker",
      "sudo usermod -aG docker ubuntu",
      "curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.my_key.private_key_pem
      host        = self.public_ip
    }
  }
}

resource "null_resource" "wait_for_ip" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Waiting for Public IP..."
      while [ -z "$(aws ec2 describe-instances --instance-ids ${aws_instance.vm.id} --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)" ]; do
        echo "Still waiting..."
        sleep 10
      done
      echo "Public IP assigned: $(aws ec2 describe-instances --instance-ids ${aws_instance.vm.id} --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)"
    EOT
  }
  depends_on = [aws_instance.vm]
}
