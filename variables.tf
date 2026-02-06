variable "aws_region" {}

variable "vpc_cidr" {}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "instance_type" {}

variable "key_name" {}

variable "trusted_ip" {}

# Amazon Linux 2 AMI (can override in tfvars)
variable "ami_id" {
  default = "ami-0c02fb55956c7d316"
}
