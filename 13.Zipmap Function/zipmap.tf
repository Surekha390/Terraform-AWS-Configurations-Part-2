provider "aws" {
  region     = "us-west-2"
}

resource "aws_iam_user" "lb" {
  name = "demo-user.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}


output "names" {
  value = aws_iam_user.lb[*].name
}

output "combined" {
  value = zipmap(aws_iam_user.lb[*].name,aws_iam_user.lb[*].arn)
}
#zipmap function is used to combine both keys and values lists for easy to understand purpose.
/* 
output:
arns = [
  "arn:aws:iam::024848474494:user/system/demo-user.0",
  "arn:aws:iam::024848474494:user/system/demo-user.1",
  "arn:aws:iam::024848474494:user/system/demo-user.2",
]
combined = {
  "demo-user.0" = "arn:aws:iam::024848474494:user/system/demo-user.0"
  "demo-user.1" = "arn:aws:iam::024848474494:user/system/demo-user.1"
  "demo-user.2" = "arn:aws:iam::024848474494:user/system/demo-user.2"
}
names = [
  "demo-user.0",
  "demo-user.1",
  "demo-user.2",
]

commands used:
terraform init
terraform plan
terraform apply
  
*/