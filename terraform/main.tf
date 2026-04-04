provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "myapp_sg" {
  name = "myapp-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myapp" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"

  key_name = "mykeypair"

  vpc_security_group_ids = [aws_security_group.myapp_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              service docker start
              usermod -a -G docker ec2-user
              EOF

  tags = {
    Name = "DevOps-Auto-EC2"
  }
}