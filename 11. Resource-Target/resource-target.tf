resource "aws_iam_user" "this" {
  name = "test-aws-user"
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.txt"
}

/*
commands used:
terraform init
   3 terraform plan -target local_file.foo
   4 terraform apply -target local_file.foo
   5 terraform destroy -target="local_file.foo"
*/

/*
terraform plan -target resource-name.local-name  —> Resource targetting —> To only create particular resource.

terraform plan -target local_file.foo    (or)

terraform plan -target=”local_file.foo”
*/