resource "aws_eip" "elasticeip" {
  instance = aws_instance.myec2[0].id
}

resource "aws_eip" "elasticeip2" {
  instance = aws_instance.myec2[1].id
}

