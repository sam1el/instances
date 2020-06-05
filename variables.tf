variable "network-details_config" {
  type = map
  default = {
      "bucket" = "student.2-jeffe-bucket"
      "key" = "student.2-instance-state"
      "region" = "us-east-2"
  }
}

variable "webserver_prefix" {
   default = "student.2-webserver-vm"
}

variable "loadbalancer_prefix" {
   default = "student.2-loadbalancer-vm"
}
