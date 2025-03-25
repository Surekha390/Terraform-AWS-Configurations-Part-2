resource "aws_iam_user" "lb" {
  name = "iamuser-${count.index}"
  count = 3
  path = "/system/"

}

output "iam_names" {
    value = aws_iam_user.lb[*].name
}

output "iam-arn" {
    value = aws_iam_user.lb[*].arn
}
/*
commands:
terraform init
   3 terraform plan
   
   5 terraform apply
   6 terraform output iam_names
   
   8 terraform output iam-arn

   (when we use output in our configuration file, after applying in future if we want to see the output, we can see by giving this command.)
   */