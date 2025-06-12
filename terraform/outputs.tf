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

# RDS id
output "rds_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_db_instance.rds_instance.id
}
# RDS Engine name
output "rds_instance_engine" {
  description = "Public IP address of the EC2 instance"
  value       = aws_db_instance.rds_instance.engine
}
# RDS Engine name
output "rds_instance_engine_version" {
  description = "Public IP address of the EC2 instance"
  value       = aws_db_instance.rds_instance.engine_version
}
# RDS Database name
output "rds_instance_db_name" {
  description = "Public IP address of the EC2 instance"
  value       = aws_db_instance.rds_instance.db_name
}
