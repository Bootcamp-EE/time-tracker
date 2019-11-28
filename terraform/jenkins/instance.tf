resource "aws_key_pair" "jenkins-key" {
  key_name = "jenkins-key"
  public_key = file(var.JENKINS_PATH_TO_PUBLIC_KEY)
}


resource "aws_instance" "ci-server" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.small"
  availability_zone = var.AWS_AVAILABILITY_ZONE
  key_name = aws_key_pair.jenkins-key.key_name
  tags = {
    "Name" = "ci-server"
  }
  subnet_id = "subnet-0a7874dd3894e19be"
}

resource "aws_network_interface_sg_attachment" "jenkins_sg_attachment" {
  security_group_id    = aws_security_group.jenkins_security_group.id
  network_interface_id = aws_instance.ci-server.primary_network_interface_id
}

resource "aws_volume_attachment" "jenkins_volume" {
  device_name = "xvdh"
  instance_id = aws_instance.ci-server.id
  volume_id = aws_ebs_volume.jenkins_backup.id
}