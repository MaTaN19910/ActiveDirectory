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

  tags = {
    Name = "Linux_host"
  }
}

resource "aws_instance" "windows_host" {
  ami           = "ami-05b1a50d6798f63cb"
  instance_type = "t3.micro"

  tags = {
    Name = "DC01"
  }
}


