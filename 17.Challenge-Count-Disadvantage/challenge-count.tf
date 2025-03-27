provider "aws" {
  region     = "us-west-2"
  
}

variable "iam_names" {
  type = list
  default = ["user-0","user-01","user-02","user-03","user-04"]
}

resource "aws_iam_user" "iam" {
  name = var.iam_names[count.index]
  count = 5
  path = "/system/"
}
#If we create resources with the use of count and count index, then when we add another name in the starting(Ex:"user-0"). Iam users cannot be
#replaced, so we will get an error when we run terraform apply. So, sometimes there will be some mess up. So we should not use it in production.
#So, we use for_each.