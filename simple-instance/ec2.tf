terraform {
  required_version = ">= 0.9, < 0.10"
}

provider "aws" {
  region = "us-west-2"
}

/* Ubuntu-16.04 ami
   t2.micro: 1 cpu , 1GB RAM
*/
resource "aws_instance" "example" {
  ami           = "ami-01e24be29428c15b2"
  instance_type = "t2.micro"
}

