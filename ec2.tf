data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instancetype
  count           = length(var.ec2_names)
  security_groups = [aws_security_group.allow_http.name]
  key_name        = var.keyname
  tags = {
    Name = var.ec2_names[count.index]
  }

  provisioner "remote-exec" {
    inline = [file("./script.sh")]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./global.pem")
      host        = self.public_ip
    }
  }

}