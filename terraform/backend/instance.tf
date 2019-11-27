resource "aws_key_pair" "timesheet-key" {
  key_name = "timesheet-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "backend-server" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = aws_key_pair.timesheet-key.key_name
  tags = {
    "Name" = "timesheet-server"
  }

  connection {
    host = self.public_ip
    type = "ssh"
    user = var.INSTANCE_USER
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

  provisioner "file" {
    source = "start-nginx.sh"
    destination = "/tmp/start-nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/start-nginx.sh",
      "sudo /tmp/start-nginx.sh"
    ]
  }

}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.http_security_group.id
  network_interface_id = aws_instance.backend-server.primary_network_interface_id
}
