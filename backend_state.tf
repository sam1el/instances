terraform {
  backend "s3" {
    bucket = "student.2-jeffe-bucket"
    key    = "student.2-network-state"
    region = "us-east-2"
  }
}

