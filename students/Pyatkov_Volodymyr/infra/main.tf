
provider "aws" {
  region = var.aws_region
}

# Получаем информацию о существующем EC2
data "aws_instance" "existing" {
  instance_id = var.instance_id
}

# Создаём новую Security Group
resource "aws_security_group" "app_sg" {
  name        = "terraform-app-sg"
  description = "Security Group managed by Terraform"
  vpc_id      = var.vpc_id

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Application
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-App-SG"
  }
}

# Подключаем новую Security Group к существующему EC2
resource "aws_network_interface_sg_attachment" "existing_sg" {
  network_interface_id = var.network_interface_id
  security_group_id    = aws_security_group.app_sg.id
}
