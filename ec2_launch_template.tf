
# EC2 web launch template
#----------------------------------------
resource "aws_launch_template" "web_server" {
  name                   = "${var.app_name}-${var.web_server_name}-template"
  image_id               = var.web_server_ami
  instance_type          = var.web_server_type
  user_data              = filebase64("${path.module}/${var.user_data_file}")
  key_name               = var.key_pair
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.alb_access_sg.id]

  tags = {
    "Name" = "${var.app_name}-${var.web_server_name}-template"
  }
}
