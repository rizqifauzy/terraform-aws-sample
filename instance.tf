resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE

  # the VPC subnet
  subnet_id = aws_subnet.main-public-2.id
  # the security group
  vpc_security_group_ids = [aws_security_group.allow-port.id]
  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  #Call User data
  user_data = data.cloudinit_config.cloudinit-example.rendered

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
    delete_on_termination = true
  }
}

resource "aws_ebs_volume" "example-volume-1" {
  availability_zone = aws_instance.example.availability_zone
  size = 20
  type = "gp2"
}

resource "aws_volume_attachment" "example-volume-1-attachment" {
  device_name = var.INSTANCE_DEVICE_NAME
  volume_id = aws_ebs_volume.example-volume-1.id
  instance_id = aws_instance.example.id
}

