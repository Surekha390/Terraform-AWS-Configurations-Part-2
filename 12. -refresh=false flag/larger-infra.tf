
#so many resources (35 resources) will be created from this code. So don't apply it. It will charge so much
/*
provider "aws" {
    region = "us-west-2"
}
*/
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  version = "5.13.0"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Managed from Terraform"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "allow_tls2" {
  name        = "terraform-firewalls"
  description = "Managed from Terraform"
}

#so many resources (35 resources) will be created from this code. So don't apply it. It will charge so much.
#terraform plan or apply refreshes the state for every resource. So, so many API calls will be done. API calls will have some limit, for every provider.
#so, we should be very careful, if we have larger infrastructure, so many resources will there.so, so many API calls should be happened.


/*
commands:
terraform plan -refresh=false  #this will not refresh the state. So, so many API calls can be reduced, each API call for each resource. 
For Ex: when we add a new resource, without refreshing, based on the existing state file, it will compare with configuration file and provides us,
one resources should be added. 
*/

#Note:
#We should not use -refresh=flase flag everytime.
  
#when we are 100% sure that our state file is in sync with the real world infrastructure, then only we should use -refresh=false flag.
#when we don't have any other option, when we have limited or restrictive no. of API calls, then we can consider this flag.