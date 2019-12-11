resource "aws_key_pair" "timesheet-key" {
  key_name = "timesheet-key"
  public_key = file(var.TIMESHEET_PUBLIC_KEY)
}

resource "aws_instance" "backend-server" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = aws_key_pair.timesheet-key.key_name
  subnet_id = "subnet-0a7874dd3894e19be"
  availability_zone = var.AWS_AVAILABILITY_ZONE
  tags = {
    "Name" = "timesheet-server"
  }

}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.http_backend_security_group.id
  network_interface_id = aws_instance.backend-server.primary_network_interface_id
}
