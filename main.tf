terraform {
  required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = "aws-lucas"
  user_data = <<-EOF
                 #!/bin/bash
                 cd /home/ubuntu
                 echo "<h1>Feito com Terraform</h1>" > index.html
                 nohup busybox httpd -f -p 8080 &
                 EOF

  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
  tags = {
    Name = "dev"
  } 
}

