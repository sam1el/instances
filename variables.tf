variable "my-vm_ami" {
  default = "ami-029fa1c105b8cc9e1"
}

variable "network-details_config" {
  type = map
  default = {
      "bucket" = "student.2-jeffe-bucket"
      "key" = "student.2-instance-state"
      "region" = "us-east-2"
  }
}
