resource "aws_key_pair" "jenkins-key" {
  key_name = "jenkins-key"
  public_key = file(var.JENKINS_PATH_TO_PUBLIC_KEY)
}


resource "aws_instance" "ci-server" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = aws_key_pair.jenkins-key.key_name
  tags = {
    "Name" = "ci-server"
  }

  connection {
    host = self.public_ip
    type = "ssh"
    user = var.INSTANCE_USER
    private_key = file(var.JENKINS_PATH_TO_PRIVATE_KEY)
  }

  provisioner "file" {
    source = "../ci"
    destination = "/tmp/ci"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/ci/script/setup-docker.sh",
      "sudo /tmp/ci/script/setup-docker.sh"
    ]
  }

}

resource "aws_network_interface_sg_attachment" "jenkins_sg_attachment" {
  security_group_id    = aws_security_group.http_security_group.id
  network_interface_id = aws_instance.ci-server.primary_network_interface_id
}
