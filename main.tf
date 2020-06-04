data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
    bucket = var.network-details_config["bucket"]
    key = var.network-details_config["key"]
    region = var.network-details_config["region"]
  }
}

resource "aws_instance" "my_vm" {
  			ami = var.my-vm_ami
			  subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
  			instance_type = "t2.micro"
        key_name = "student.2-vm-key"
        vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id
  			tags = {
				Name = "student.2-vm1"
  			}
}
