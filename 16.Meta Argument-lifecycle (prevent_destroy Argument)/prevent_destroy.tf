provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"
    subnet_id = "subnet-035810c6619ba14aa"

    tags = {
        Name = "HelloEarth"
    }
    lifecycle {
      prevent_destroy = true
    }
}