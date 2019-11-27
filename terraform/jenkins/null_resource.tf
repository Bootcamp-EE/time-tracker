resource "null_resource" "intall_jenkins" {
  connection {
    host = aws_instance.ci-server.public_ip
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