resource "null_resource" "install_jenkins" {

  depends_on = [
    aws_eip_association.jenkins_static_ip_association
  ]

  triggers ={
    instance_id=aws_instance.ci-server.id
  }
  connection {
    host = aws_eip.static_ip.public_ip
    type = "ssh"
    user = var.INSTANCE_USER
    private_key = file(var.JENKINS_PATH_TO_PRIVATE_KEY)
  }

  provisioner "file" {
    source = "../../ci"
    destination = "/tmp/ci"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/ci/setup-docker.sh",
      "sudo /tmp/ci/setup-docker.sh"
    ]
  }
}