module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "security" {
  source     = "./modules/security"
  vpc_id     = module.vpc.vpc_id
  trusted_ip = var.trusted_ip
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  private_subnet_id = module.vpc.private_subnet_ids[0]
  sg_id             = module.security.ec2_sg_id
  key_name          = var.key_name
  user_data         = "${path.module}/user_data.sh"
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  sg_id             = module.security.alb_sg_id
  instance_id       = module.ec2.instance_id
}
