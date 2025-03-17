terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content         = tls_private_key.my_key.private_key_pem
  filename        = "tomer-key.pem"
  file_permission = "0600"
}

resource "aws_key_pair" "aws_key" {
  key_name   = "aws_key"
  public_key = tls_private_key.my_key.public_key_openssh
}
