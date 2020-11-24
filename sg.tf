resource "aws_security_group" "allow_http" {
  name        = var.secgroup
  description = "Allow HTTP and HTTPS inbound traffic"


  ingress {
    description = "TLS from VPC"
    from_port   = var.http
    to_port     = var.http
    protocol    = var.protocol
    cidr_blocks = var.cidrrange
  }

  ingress {
    description = "SSH connection"
    from_port   = var.ssh
    to_port     = var.ssh
    protocol    = var.protocol
    cidr_blocks = var.cidrrange
  }

  ingress {
    description = "HTTPS Connection"
    from_port   = var.https
    to_port     = var.https
    protocol    = var.protocol
    cidr_blocks = var.cidrrange
  }

  ingress {
    description = "Jenkins Access"
    from_port   = var.jenkins
    to_port     = var.jenkins
    protocol    = var.protocol
    cidr_blocks = var.cidrrange
  }

  egress {
    from_port   = var.http
    to_port     = var.http
    protocol    = var.protocol
    cidr_blocks = var.cidrrange
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
