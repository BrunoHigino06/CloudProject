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
  port     = var.port[0]
  protocol = var.protocol[0]
  target_type = var.target_type
  vpc_id   = var.vpc_id
}
#Load balance listeners
#FrontEnd listener with redirect to 443
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.blog_lb.arn
  port              = var.port[0]
  protocol          = var.protocol[0]

  default_action {
    type = "redirect"

    redirect {
      port        = var.port[1]
      protocol    = var.protocol[1]
      status_code = "HTTP_301"
    }
  }
}
#Public certificate
resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method

  tags = {
    Environment = var.Environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

#Route53 certificate record
resource "aws_route53_record" "CertificateRecord" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = var.CertificateRecord.ttl
  type            = each.value.type
  zone_id         = var.CertificateRecord.zone_id

  depends_on = [
    aws_acm_certificate.cert
  ]
}

resource "aws_acm_certificate_validation" "CertificateValidantion" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.CertificateRecord : record.fqdn]
  
  depends_on = [
    aws_acm_certificate.cert
  ]
}

#Listener backend forward to containers
resource "aws_lb_listener" "BackEnd" {
  load_balancer_arn = aws_lb.blog_lb.arn
  port              = var.port[1]
  protocol          = var.protocol[1]
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blog_tg.arn
  }
  depends_on = [
    aws_acm_certificate.cert,
    aws_route53_record.CertificateRecord,
    aws_acm_certificate_validation.CertificateValidantion
  ]
}