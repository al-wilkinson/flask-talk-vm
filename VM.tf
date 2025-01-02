terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_key_pair" "deployer" {
  key_name = "flask-demo-key"
  public_key = file("~/.ssh/flask-demo-vm.pub")
}

resource "aws_instance" "demo-vm" {
  ami           = "ami-07d9cf938edb0739b"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name

  tags = {
    Name = "FlaskDemo"
  }
}

output "key_pair" {
  description = "My key pair"
  value = aws_key_pair.deployer.public_key
}

output "public_ip_address" {
  description = "Public IP address of our instance"
  value = aws_instance.demo-vm.public_ip
}