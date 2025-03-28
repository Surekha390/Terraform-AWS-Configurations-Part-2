provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-071226ecf16aa7d96"
  instance_type = "t2.micro"
  subnet_id = "subnet-035810c6619ba14aa"
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> server_ip.txt"
    #command = "echo Hello"
  }

}