resource "aws_iam_user" "lb" {
  name = "demo-iamuser"
  
  provisioner "local-exec" {
    command = "echo local-exec provisioner is starting"
  }
  
  provisioner "local-exec" {
    command = "echo local-exec provisioner is starting for 2nd time"
  }
}