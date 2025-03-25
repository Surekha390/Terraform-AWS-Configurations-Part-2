resource "local_file" "foo" {
  #content  = "Hello World"
  #filename = "local-file.txt"
  
  content  = "New content"
  filename = "local-file-2.txt"
}

/*
terraform init
terraform plan -out infra.plan
After, we make a file with plan and when we make changes to it with new content and file name, and when we do:
terraform apply infra.plan
we get the old file name and old content, what was there when we did plan.
terraform show infra.plan (or) terraform show to see the contents in file (or) terraform show -json infra.plan
*/
