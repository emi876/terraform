variable "ec2_names" {
  type    = list
}

variable "region" {
  type = string
}

variable "secgroup" {
  type = string
}

variable "cidrrange" {
  type = list
}

variable "http" {
  type = number
}

variable "https" {
  type = number
}

variable "jenkins" {
  type = number
}

variable "ssh" {
  type = number
}

variable "protocol" {
  type = string
}

variable "instancetype" {
  type = string
  default = "t2.micro"
}

variable "keyname" {
  type = string
  default = "global"
}