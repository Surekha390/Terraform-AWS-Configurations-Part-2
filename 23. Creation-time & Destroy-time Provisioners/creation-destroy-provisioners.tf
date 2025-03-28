resource "aws_iam_user" "lb" {
  name = "demo-iamuser"
  
  provisioner "local-exec" {
    command = "echo1 This is creation time provisioner"
    on_failure = continue  #It helps to continue normally, eventhough errors occurs during provisioning and apply will run successfully.
    #we can give "fail" if we want to have errors shown and to have errors when terraform apply.
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