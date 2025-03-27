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
    create_before_destroy = true
  }
}

#when we need to replace an instance by changing it to new AMI, then the resource must be replaced, in this case, generally old resource 
#will be deleted first and then it creates the new resource. When we use " create_before_destroy " argument which belongs to "lifecycle" 
#meta-argumet , then it changes the default behiour to create the new resource first and delete the old resource next.