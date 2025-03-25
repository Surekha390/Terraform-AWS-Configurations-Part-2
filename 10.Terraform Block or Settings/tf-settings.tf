#terraform settings block
terraform {
    #required_version = "1.8" 
    #our terraform core version is v1.11.1(which we installed), so this gives an error, when we give other version here. 
    #we can check our version using "terraform version" command in CLI. So here the version should be correct. we cannot give another version here. 
    #when we want to change this version, then we have to change the installed version in our pc.
    required_providers {
    aws = {
      version = "5.6.0"   #we can give another version here(no needed to be latest) by running " terraform init -upgrade " command. If we don't give any version, by default it will take latest.
      source = "hashicorp/aws"
    }
  }
}



resource "aws_security_group" "sg_01" {
    name = "app_firewall"
}


/*
 terraform settings documentation:
 https://developer.hashicorp.com/terraform/language/terraform

terraform init -upgrade
*/