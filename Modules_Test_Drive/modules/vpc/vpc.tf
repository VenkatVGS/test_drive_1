# VPC
resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "myvpc"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Internet_gw"
  }
}

# Subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet_1_in
  availability_zone = var.public_az_1_in
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet_2_in
  availability_zone = var.public_az_2_in
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet_1_in
  availability_zone = var.private_az_1_in
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet_2_in
  availability_zone = var.private_az_2_in
  tags = {
    Name = "Main"
  }
}

# Route_Table
resource "aws_route_table" "public_rt1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table" "public_rt2"{
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table" "private_rt1"{
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_1.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table" "private_rt2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_2.id
  }

  tags = {
    Name = "example"
  }
}

# Route_Table_Association
resource "aws_route_table_association" "public_rt_ass_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt1.id
}

resource "aws_route_table_association" "public_rt_ass_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt2.id
}

resource "aws_route_table_association" "private_rt_ass_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt1.id
}

resource "aws_route_table_association" "private_rt_ass_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt2.id
}


# EIP
resource "aws_eip" "myeip1" {
  vpc = true
}

resource "aws_eip" "myeip2" {
 vpc = true
}
# NAT GT
resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.myeip1.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "NAT_1"
  }
}

resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.myeip2.id
  subnet_id     = aws_subnet.public_subnet_2.id

  tags = {
    Name = "NAT_2"
  }
}

# Security Groups

resource "aws_security_group" "public_sg" {
  name        = "allow_ssh_http"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "allow_ssh_http_mysql"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "mysql"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}