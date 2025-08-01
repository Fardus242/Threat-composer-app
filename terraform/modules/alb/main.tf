terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


resource "aws_lb" "this" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "app-lb"
  }
}

resource "aws_lb_target_group" "this" {
  name        = "app-tg"
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  target_type = "ip" 

  vpc_id = var.vpc_id

  health_check {
    path                = var.health_check_path
    matcher             = var.health_check_matcher
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = {
    Name = "app-tg"
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
