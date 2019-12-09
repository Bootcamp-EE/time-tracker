resource "null_resource" "install_nginx" {
  connection {
    host = aws_eip.static_ip.public_ip
    type = "ssh"
    user = var.INSTANCE_USER
    private_key = var.TIMESHEET_PRIVATE_KEY
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
  depends_on = [
    aws_network_interface_sg_attachment.sg_attachment,
    aws_eip_association.static_ip_association
  ]

  triggers = {
    instance_id = aws_instance.backend-server.id
  }
}