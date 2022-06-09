
resource "aws_autoscaling_group" "websrv_asg" {
  availability_zones = ["ap-south-1a"]
  desired_capacity = 1
  max_size         = 2
  min_size         = 1

  launch_template {
    id      = aws_launch_template.websrv_lt.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "websrv_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.websrv_asg.id
  lb_target_group_arn    = aws_lb_target_group.websrv_tg.arn
}