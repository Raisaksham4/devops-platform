provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myapp" {
  ami           = "ami-0f58b397bc5c1f2e8" # Amazon Linux (ap-south-1)
  instance_type = "t3.micro"

  key_name = "mykeypair"  # use your key name

  tags = {
    Name = "DevOps-Auto-EC2"
  }
}