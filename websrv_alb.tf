resource "aws_lb" "websrv_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_only.id]
  subnets            = data.aws_subnets.selected.ids

  tags = {
    Environment = "development"
  }
}

# Target group configuration

resource "aws_lb_target_group" "websrv_tg" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
}

#Listners configuration
resource "aws_lb_listener" "websrv_listner" {
  load_balancer_arn = aws_lb.websrv_alb.arn
  port              = "80"
  protocol          = "HTTP"
  #   ssl_policy        = "ELBSecurityPolicy-2016-08"
  #   certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.websrv_tg.arn
  }
}