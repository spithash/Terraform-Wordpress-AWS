#EC2
resource "aws_instance" "wordpress" {
  ami                         = "ami-02003f9f0fde924ea" # We're using Ubuntu cloud image 24.04 LTS amd64
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  subnet_id                   = aws_subnet.public1.id
  security_groups             = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
}

#rds subnet
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
}

#RDS INSTANCE
resource "aws_db_instance" "rds_instance" {
  engine                    = "mysql"
  engine_version            = "5.7.44"
  skip_final_snapshot       = true
  final_snapshot_identifier = "final-snapshot"
  instance_class            = "db.t2.micro"
  # I'm using 1GB just to test, we would allocate 20GB to max out.
  allocated_storage      = 1
  identifier             = "rds-instance"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  tags = {
    Name = "RDS Instance"
  }
}

# RDS security group
resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.100.0.0/16"]
  }

  tags = {
    Name = "RDS Security Group"
  }
}
