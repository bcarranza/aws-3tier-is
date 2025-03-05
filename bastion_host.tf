resource "aws_instance" "bastion_host" {
  ami           = var.bastion_ami
  instance_type = var.bastion_type
  subnet_id     = aws_subnet.public_subnets["public-subnet-1"].id
  key_name      = var.key_pair
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  
  root_block_device {
    volume_size = 50  # Tamaño del disco en GB
    volume_type = "gp2"  # Tipo de volumen (gp2, io1, standard, etc.)
  }

  tags = {
    Name = "Bastion Host"
  }
}