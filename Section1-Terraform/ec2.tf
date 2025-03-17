resource "aws_instance" "vm" {
  ami                    = "ami-04b70fa74e45c3917" # Ubuntu 22.04 LTS AMI
  instance_type          = "t3.medium"
  key_name               = aws_key_pair.aws_key.key_name
  subnet_id              = data.aws_subnets.selected.ids[0]
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.tomer_sg.id]

  tags = {
    Name = "builder"
  }

  provisioner "remote-exec" {
    inline = [
  "sudo apt update -y",
  "sudo apt install -y docker.io",
  "sudo systemctl start docker",
  "sudo systemctl enable docker",
  "sudo usermod -aG docker ubuntu", 
  "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
  "sudo chmod +x /usr/local/bin/docker-compose",
  "docker --version", 
  "docker-compose --version"
]


    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.my_key.private_key_pem
      host        = self.public_ip
    }
  }
}
