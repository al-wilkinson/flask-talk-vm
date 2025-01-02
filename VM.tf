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
  key_name = "deployer-key"
  public_key = file("~/.ssh/flask-demo-vm.pub")
}

resource "aws_instance" "demo-vm" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name

  tags = {
    Name = "FlaskDemo"
  }
}
