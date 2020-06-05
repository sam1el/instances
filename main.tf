data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
    bucket = var.network-details_config["bucket"]
    key = var.network-details_config["key"]
    region = var.network-details_config["region"]
  }
}

module "webserver" {
  source = "./modules/linux_node"
  ami = "ami-029fa1c105b8cc9e1"
  instance_type = "t2.micro"
  instance_count = "1"
  key_name  = data.terraform_remote_state.network_details.outputs.vm_ssh_key
  subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
  vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id
  tags = var.webserver_prefix
  hab_service_name = "hab-sup"
  hab_service_type = "systemd"
  hab_service = "winhab/tf_apache"
  hab_strategy = "at-once"
  hab_topology = "standalone"
}

module "loadbalancer" {
  source = "./modules/linux_node"
  instance_count = "0"
  ami = "ami-029fa1c105b8cc9e1"
  instance_type = "t2.micro"
  key_name = data.terraform_remote_state.network_details.outputs.vm_ssh_key
  subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
  vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id
  tags = var.loadbalancer_prefix
  hab_service_name = "hab-sup"
  hab_service_type = "systemd"
  hab_service = "winhab/tf_load"
  hab_strategy = "at-once"
  hab_topology = "standalone"
}
