aws_region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

azs = [
  "us-east-1a",
  "us-east-1b"
]

instance_type = "t3.micro"
key_name      = "abin"

trusted_ip = "103.176.185.117/32"


