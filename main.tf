data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
    bucket = "student.2-jeffe-bucket"
    key = "student.2-instance-state"
    region = "us-east-2"
  }
}

resource "aws_instance" "my_vm" {
  			ami = "ami-029fa1c105b8cc9e1"
			subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
  			instance_type = "t2.micro"
  			tags = {
				Name = "student.2-vm1"
  			}
}
