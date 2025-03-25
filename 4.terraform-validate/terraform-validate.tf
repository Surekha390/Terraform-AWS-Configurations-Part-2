provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f"
  #instance_type = var.instancetype  #throws error
  #sky = "blue" #throws error
}

#we have to run terraform validate and it checks for syntax errors and throws errors.

#when we add instance_type = var.instance_type and when we don’t have variables section with instance_type, then it throws an error, 
#Reference to undeclared input variable.

#when we add sky = “blue” argument in aws_instance resource, and when we run terraform validate, it throws an error stating that “unsupported argument”
#