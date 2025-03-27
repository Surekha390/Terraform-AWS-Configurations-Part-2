provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-0b6d6dacf350ebc82"
    instance_type = "t2.micro"
    

    tags = {
        #Name = "HelloEarth-New"
        Name = "My-ec2"
    }
    
    lifecycle {
      #ignore_changes = [tags,instance_type]
      ignore_changes = all
    }
    
}

/*
**Meta-Arguments:**  used to customize the behaviour of resources in Terraform.

Lifecycle: Allows modification of the resource lifecycle.(lifecycle is from resource creation, state file, plan,apply all that lifecycle.)

**lifecycle**: To make certain level of customization to our infrastructure created through Terraform.

Scenario: lifecycle used with **ignore_changes** argument. we can use other arguments also in lifecycle.

lifecycle meta argument is used, when we have created a resource through Terraform and we want to make changes to this resource in our console,
but our terraform should ignore that change. So it should not delete  the manually created ones.
Ex: Through this file, we create a EC2 instance and we want to add one more tag key as "Env" and Value as "Prod", then when we run Terraform plan,
then it shows that we should remove that extra tag, which is not there in our configuration file. So, when we use "lifecycle" meta data, Terraform will ignore 
the changes and Terraform plan or Apply won't do any change to our Tag which we created manually.

Dis-advantage: Biggest dis-advantage is, when we want to make changes to our attributes which we specified in ignore_changes list through
Terraform configuration, Terraform ignores those changes also including manual changes.  
Ex: when we want to chnage the tag from name="HelloEarth-New" to Name = "My-ec2" , Terraform won't even allow these changes. Terraform
will simply ignore.
*/