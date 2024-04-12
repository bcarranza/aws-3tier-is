# ALB
#----------------------------------------
resource "aws_lb" "web_alb" {
  depends_on         = [aws_subnet.public_subnets, aws_subnet.private_subnets]
  name               = "${var.app_name}-${var.load_balancer_name}"
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.web_access_sg.id]
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]

  tags = {
    Name = "${var.app_name}-${var.load_balancer_name}"
  }
}

# ALB target groups 
#----------------------------------------
# HTTP
resource "aws_lb_target_group" "web_alb_tg_http" {
  depends_on = [aws_lb.web_alb]
  name       = "${var.app_name}-${var.web_alb_tg_http["name"]}"
  port       = var.web_alb_tg_http["port"]
  protocol   = var.web_alb_tg_http["protocol"]
  vpc_id     = aws_vpc.vpc.id
}

# # HTTPS
# resource "aws_lb_target_group" "web_alb_tg_https" {
#   depends_on = [aws_lb.web_alb]
#   name       = "${var.app_name}-${var.web_alb_tg_https["name"]}"
#   port       = var.web_alb_tg_https["port"]
#   protocol   = var.web_alb_tg_https["protocol"]
#   vpc_id     = aws_vpc.vpc.id
# }


# ALB listeners
#----------------------------------------
# HTTP
resource "aws_lb_listener" "web_alb_listener_http" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = var.web_alb_listener_http["port"]
  protocol          = var.web_alb_listener_http["protocol"]

  default_action {
    type             = var.web_alb_listener_http["action_type"]
    target_group_arn = aws_lb_target_group.web_alb_tg_http.arn
  }
}

# # HTTPS
# resource "aws_lb_listener" "web_alb_listener_https" {
#   load_balancer_arn = aws_lb.web_alb.arn
#   port              = var.web_alb_listener_https["port"]
#   protocol          = var.web_alb_listener_https["protocol"]

#   default_action {
#     type             = var.web_alb_listener_http["action_type"]
#     target_group_arn = aws_lb_target_group.web_alb_tg_https.arn
#   }
# }
