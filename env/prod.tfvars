# AWS Region
aws_region = "us-east-1"

# Networking
vpc_cidr = "10.1.0.0/16"

public_subnets = [
  "10.1.1.0/24",
  "10.1.2.0/24"
]

private_subnets = [
  "10.1.11.0/24",
  "10.1.12.0/24"
]

azs = [
  "us-east-1a",
  "us-east-1b"
]

# EC2
instance_type = "t3.small"
key_name      = "abin"

# Security
# Only office / VPN IP should be allowed for SSH
trusted_ip = "103.176.185.117/32"

# Optional: AMI override (recommended in prod)
# ami_id = "ami-0abcdef1234567890"

