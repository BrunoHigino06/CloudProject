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