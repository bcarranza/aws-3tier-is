# Bastion Host Access
resource "aws_security_group" "bastion_sg" {
  name        = "${var.app_name}-bastion-sg"
  description = "Allow all for bastian host"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "ssh from IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.all_traffic]
    ipv6_cidr_blocks = ["::/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  timeouts {
    delete = var.ssh_sg["timeout_delete"]
  }

  tags = {
    Name = "${var.app_name}-bastion-sg"
  }
}
