output "alb_dns_name" {
  description = "Public DNS of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_ec2_id" {
  value = module.ec2.instance_id
}
