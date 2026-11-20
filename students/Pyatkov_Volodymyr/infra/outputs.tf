
output "instance_ip" {
  description = "Public IP of existing EC2 instance"
  value       = data.aws_instance.existing.public_ip
}

output "instance_id" {
  description = "Existing EC2 instance ID"
  value       = data.aws_instance.existing.id
}

output "security_group_id" {
  description = "New Terraform Security Group ID"
  value       = aws_security_group.app_sg.id
}
