
resource "aws_instance" "myec2" {
    ami = "ami-0b6d6dacf350ebc82"
    instance_type = "t2.micro"
}

# terraform apply -replace="aws_instance.myec2"   This command is used to replace the existing resource.
#In older versions terraform taint was there, which also replaces the resource.