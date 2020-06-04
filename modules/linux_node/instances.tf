resource "aws_instance" "my_vm" {
  ami = var.ami
	subnet_id = var.subnet_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  count = var.instance_count
  tags = {
    Name = var.tags
  }
}
