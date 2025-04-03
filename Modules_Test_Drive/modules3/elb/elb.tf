resource "aws_lb" "my_alb" {
  load_balancer_type = var.load_balan_type
  security_groups    = [var.public_sg_elb]

    subnet_mapping {
    subnet_id     = var.public_subnet_1_elb
  }

  subnet_mapping {
    subnet_id     = var.public_subnet_2_elb
  }


  tags = {
    Environment = "app_lb"
  }
}

resource "aws_lb_target_group" "my_target" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_elb
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target.arn
  }
}

resource "aws_lb_target_group_attachment" "my_target_grp_attach_1" {
  target_group_arn = aws_lb_target_group.my_target.arn
  target_id        = var.web_1_elb
  port             = 80
}

resource "aws_lb_target_group_attachment" "my_target_grp_attach_2" {
  target_group_arn = aws_lb_target_group.my_target.arn
  target_id        = var.web_2_elb
  port             = 80
}