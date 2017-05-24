variable "subnet_id" {}

resource "aws_instance" "test_instance_with_override" {
  ami           = "${aws_ami.test_ami.id}"
  instance_type = "m1.micro"
  subnet_id     = "${var.subnet_id}"

  /* 'root_block_device' section is required for proper detection of the instance root device */
  root_block_device {
    volume_size           = 15
    delete_on_termination = false
  }

  /* Any additional block devices must be defined in 'ebs_block_device' section */
  ebs_block_device {
    device_name = "disk2"
    volume_size = 5
  }
}
