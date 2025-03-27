variable "my-map" {
    default = {
        dev = "ami-123"
        prod = "ami-456"
    }
}

resource "aws_instance" "web" {
  for_each = var.my-map
  ami           = each.value  #if we want key, we can specify each.key
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }
}

