ec2_names = ["jenkins-master", "jenkins-slave"]
region = "us-east-1"
secgroup = "allow-internet connectivity"
cidrrange = ["0.0.0.0/0"]
http = 80
https = 443
jenkins = 8080
ssh = 22
protocol = "tcp"
instancetype = "t2.small"
keyname = "global"

