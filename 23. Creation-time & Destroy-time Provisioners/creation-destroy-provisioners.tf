resource "aws_iam_user" "lb" {
  name = "demo-iamuser"
  
  provisioner "local-exec" {
    command = "echo This is creation time provisioner"
  }
  
  provisioner "local-exec" {
    command = "echo This is destroy time provisioner"
    when = destroy
  }
}

/*
when a resource is created but provisioner is failed, due to some reasons, then when we run terraform apply again, then it will delete the 
created resource and try to replace it with new resource, as the resource is tainted.(means not fully created along with provisioners).
*/