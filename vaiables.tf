variable "ami" {
  type    = string
  default = "ami-079b5e5b3971bd10d"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "asg-Web-Server"
}

variable "lt_name" {
  type    = string
  default = "websrv_launch_temp"
}

variable "alb_name" {
  type    = string
  default = "websrv-alb"
}

variable "tg_name" {
  type    = string
  default = "websrv-tg"
}