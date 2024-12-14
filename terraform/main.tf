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
  region  = "us-east-1"
}

resource "aws_instance" "linux_host" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  key_name = "linux"
  
  tags = {
    Name = "Linux_host"
  }
}

#output "instance_public_ip" {
#  description = "Public IP address of the EC2 instance"
#  value       = aws_instance.linux_host.public_ip
#}

output "key_name" {
  description = "Name of key for ssh connection"
  value       = aws_instance.linux_host.key_name
}

resource "aws_instance" "windows_host" {
  ami           = "ami-05b1a50d6798f63cb"
  instance_type = "t3.micro"
  key_name = "windows"
  
  

  tags = {
    Name = "DC01"
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.windows_host.public_ip
}




