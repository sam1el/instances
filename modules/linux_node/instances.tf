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

  provisioner "habitat" {
    connection {
  	host = self.public_ip
  	type = "ssh"
  	user = var.vm_user
  	password = var.vm_pass
  	agent = true
  	private_key = file("../keys/student.2-vm-key")
    }
    use_sudo = true
    service_type = var.hab_service_type
    accept_license = true
    service_name = var.hab_service_name

    service {
      name = var.hab_service
      strategy = var.hab_strategy
      topology = var.hab_topology
    }
  }
}
