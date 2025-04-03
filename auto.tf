# # Launch Template
# resource "aws_launch_template" "web_lt" {
#   name_prefix   = "web-lt"
#   image_id      = "ami-01bd9d8f06d29d6a0"
#   instance_type = "t2.micro"
#   key_name      = "vgs_mumbai"
#   associate_public_ip_address = true
#   security_groups             = [aws_security_group.public_sg.id]
#   user_data = filebase64("web-apps.sh")

#     tags = {
#       Name = "webserver"
#     }
  
# }

# # Auto Scaling Group
# resource "aws_autoscaling_group" "web_asg" {
#   desired_capacity     = 2
#   min_size            = 1
#   max_size            = 3
#   vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

#   launch_template {
#     id      = aws_launch_template.web_lt.id
#     version = "Latest"
#   }

#   tag {
#     key                 = "Name"
#     value               = "webserver"
#     propagate_at_launch = true
#   }
# }

# # Scaling Policy - Scale Out (Increase Instances)
# resource "aws_autoscaling_policy" "scale_out" {
#   name                   = "scale_out"
#   scaling_adjustment     = 1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 60
#   autoscaling_group_name = aws_autoscaling_group.web_asg.name
# }

# # Scaling Policy - Scale In (Decrease Instances)
# resource "aws_autoscaling_policy" "scale_in" {
#   name                   = "scale_in"
#   scaling_adjustment     = -1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 60
#   autoscaling_group_name = aws_autoscaling_group.web_asg.name
# }
