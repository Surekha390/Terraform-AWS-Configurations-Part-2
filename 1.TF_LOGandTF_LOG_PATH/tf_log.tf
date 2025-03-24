resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.txt"
}


#Now we set environment variables, TF_LOG and TF_LOG_PATH, so that we get logs in terraform.txt. 
#From this .tf file output, we get foo.txt file