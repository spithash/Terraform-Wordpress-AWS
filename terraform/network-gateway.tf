# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "upgrad-igw"
  }
}

# Public route table with route to IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Private route table with no internet gateway route
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "private-rt"
  }
}

