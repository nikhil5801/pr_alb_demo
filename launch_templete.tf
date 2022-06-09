resource "aws_launch_template" "websrv_lt" {
  name          = var.lt_name
  image_id      = var.ami
  instance_type = var.instance_type

  key_name = var.key_name

  monitoring {
    enabled = true
  }
  vpc_security_group_ids = [aws_security_group.allow_http_only.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "websrv_tf"
    }
  }

  user_data = filebase64("${path.module}/user_data.sh")
}