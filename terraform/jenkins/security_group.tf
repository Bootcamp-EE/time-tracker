resource "aws_security_group" "jenkins_security_group" {
  name        = "allow_http_jenkins"
  description = "Allow all inbound http traffic"
  vpc_id = "vpc-0a6e28089e24a4f9f"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 49001
    to_port     = 49001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_jenkins"
  }
}
