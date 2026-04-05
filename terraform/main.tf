provider "aws" {
  region = "ap-south-1"
}

# -------------------------
# SECURITY GROUP
# -------------------------
resource "aws_security_group" "myapp_sg" {
  name = "myapp-sg-auto"

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

# -------------------------
# IAM ROLE
# -------------------------
resource "aws_iam_role" "ec2_role" {
  name = "ec2-ecr-role-auto"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile-auto"
  role = aws_iam_role.ec2_role.name
}

# -------------------------
# EC2 INSTANCE
# -------------------------
resource "aws_instance" "myapp" {
  ami           = "ami-045443a70fafb8bbc"
  instance_type = "t2.micro"

  key_name = "devops-key"

  vpc_security_group_ids = [aws_security_group.myapp_sg.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install docker -y
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user
              EOF

  tags = {
    Name = "DevOps-Auto-EC2"
  }
}

# -------------------------
# OUTPUT PUBLIC IP
# -------------------------
output "ec2_public_ip" {
  value = aws_instance.myapp.public_ip
}