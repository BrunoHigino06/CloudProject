#Application load balance
resource "aws_lb" "blog_lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = var.lb_sg
  subnets            = var.lb_subnets

  tags = {
    Environment = "production"
  }
}
#Target Group
resource "aws_lb_target_group" "blog_tg" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = var.vpc_id
}
#Load balance listener
1