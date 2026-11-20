
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "instance_id" {
  description = "Existing EC2 instance ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID of existing EC2"
  type        = string
}
variable "network_interface_id" {
  description = "Network interface ID of existing EC2"
  type        = string
}
