output "web_security_group_id" {
  description = "Security group ID for the web server"
  value       = aws_security_group.web.id
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IPv4 address"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "Nginx website URL"
  value       = "http://${aws_instance.web.public_ip}"
}

output "iam_role_name" {
  description = "IAM role attached to the EC2 instance"
  value       = aws_iam_role.ec2_ssm.name
}

output "instance_profile_name" {
  description = "IAM instance profile attached to the EC2 instance"
  value       = aws_iam_instance_profile.ec2.name
}
