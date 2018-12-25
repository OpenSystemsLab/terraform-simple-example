terraform {
  required_version = ">= 0.9, < 0.10"
}

provider "aws" {
  region = "us-west-2"
}
data "aws_availability_zones" "available" {}


resource "aws_security_group" "instance" {
  name = "go-api-instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_launch_configuration" "example" {
  image_id        = "ami-01e24be29428c15b2"
  instance_type   = "t2.micro"
  /* key_name        = "testInstanceKeyPair" */
  security_groups = ["${aws_security_group.instance.id}"]
  user_data       = "${file("setup.sh")}"

  lifecycle {
    create_before_destroy = true
  }
}


