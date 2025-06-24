# EC2 Instance in public subnet
resource "aws_instance" "wordpress" {
  ami                         = "ami-02003f9f0fde924ea"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  subnet_id                   = aws_subnet.public1.id
  security_groups             = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name = "WordPress"
  }
}

