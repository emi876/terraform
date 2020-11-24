output "subnetID" {
    value = aws_instance.myec2[1].subnet_id
}

output "elasticIPAddress1" {
  value = aws_eip.elasticeip.public_ip
}

output "elasticIPAddress2" {
  value = aws_eip.elasticeip2.public_ip
}