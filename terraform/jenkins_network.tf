resource "aws_eip_association" "jenkins_static_ip_association" {
  instance_id = aws_instance.ci-server.id
  allocation_id = aws_eip.static_ip.id
}
