# WordPress instance id
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.wordpress.id
}
# WordPress instance public IP
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.wordpress.public_ip
}

