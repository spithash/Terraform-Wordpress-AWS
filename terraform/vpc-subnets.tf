# VPC
resource "aws_vpc" "this" {
  cidr_block = "10.100.0.0/16"
  tags = {
    Name = "upgrad-vpc"
  }
}

# Public subnets
resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.100.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "upgrad-public-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.100.2.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "upgrad-public-2"
  }
}

