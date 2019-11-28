resource "aws_ebs_volume" "jenkins_backup" {
  availability_zone = var.AWS_AVAILABILITY_ZONE
  size = 1
  tags= {
    Name="jenkins_store"
  }
}