resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.key_name
  user_data              = file(var.user_data)

  tags = {
    Name = "strapi-private-ec2"
  }
}
