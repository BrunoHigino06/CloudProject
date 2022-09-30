#Application load balance
resource "aws_lb" "blog_lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = var.lb_sg
  subnets            = var.lb_subnets

  tags = {
    Environment = var.Environment
  }
}
#Target Group
resource "aws_lb_target_group" "blog_tg" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = var.protocol[0]
  target_type = "ip"
  vpc_id   = var.vpc_id
}
#Load balance listeners
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.blog_lb.arn
  port              = "80"
  protocol          = var.protocol[0]

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = var.protocol[1]
      status_code = "HTTP_301"
    }
  }
}