resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns-in-output" {
    value = aws_iam_user.lb[*].arn
}

#we call ' * ' as splat expression. Used to specify all.