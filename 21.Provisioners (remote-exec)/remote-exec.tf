provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-071226ecf16aa7d96"
  instance_type = "t2.micro"
  subnet_id = "subnet-035810c6619ba14aa"
  key_name = "terraform-key"
  vpc_security_group_ids = ["sg-0931cf5811d6da74a"]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraform-key.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx",
    ]
  }
}

