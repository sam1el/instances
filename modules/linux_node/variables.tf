variable "instance_type" {
  default = "t2.micro"
}

variable "instance_count" {}

variable "ami" {
  default = "ami-029fa1c105b8cc9e1"
}

variable "tags" {
  default = "student.2-vm1"
}

variable "subnet_id" {
  default = "subnet-1"
}

variable "vpc_security_group_ids" {
  default = "student.2-security-group"
}

variable "key_name" {
  default = "student.2-vm-key"
  }

variable "region" {
  default = "us-east-2"
}

variable "profile" {
  default = "student.2"
}

variable "vm_user" {
  default = "ubuntu"
}

variable "vm_pass" {
  default = "null"
}

variable "hab_service_name" {}

variable "hab_service_type" {}

variable "hab_service" {}

variable "hab_strategy" {}

variable "hab_topology" {}
