variable "network-details_config" {
  type = map
  default = {
      "bucket" = "student.2-jeffe-bucket"
      "key" = "student.2-instance-state"
      "region" = "us-east-2"
  }
}
