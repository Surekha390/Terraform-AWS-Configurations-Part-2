resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}

/*
1. All .tf files will be specified in alphabetic order in our folder. So that it is easy for us to identify.
2. Terraform files loaded must end in either .tf or .tf.json to specify the format that is in use.
3. Blocks should be separated in production for every usecase like provider,variables,ec2,iam_user etc. so that it would be easy to add new resources later, by 
going to the specific folder.
4. we don't see the result of alphabetic order in command prompt. we can see that the files arranged in alphabetic order in our folder in our local system.
*/
