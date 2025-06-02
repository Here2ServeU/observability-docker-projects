provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "monitoring" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t2.micro"
  key_name               = "monitoring-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "monitoring-demo"
  }
}

resource "aws_key_pair" "monitoring" {
  key_name   = "monitoring-key"
  public_key = file("monitoring-key.pub")
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
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