# VPC 생성
resource "aws_vpc" "vir-vpc" {
  cidr_block           = "10.240.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VIR-PRD-VPC"
  }
}

# IGW 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = resource.aws_vpc.vir-vpc.id
  tags = {
    Name = "VIR-PRD-IGW"
  }
}

# EIP 생성
resource "aws_eip" "awesome-loadbalancer-eip" {
  instance = aws_instance.loadbalancer.id
  vpc      = true

  tags = {
    Name = "VIR-PRD-NGW-2A-EIP"
  }
}

resource "aws_eip" "awesome-nat-eip" {
  vpc = true

  tags = {
    Name = "VIR-PRD-NGW-2C-EIP"
  }
}

# NAT 생성
resource "aws_nat_gateway" "awesome-nat" {
  allocation_id = aws_eip.awesome-nat-eip.id
  subnet_id     = aws_subnet.pub_sub_c.id

  tags = {
    Name = "VIR-PRD-NGW-2A"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


# Public rtb
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vir-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "VIR-PRD-RT-PUB"
  }
}

# Private rtb
resource "aws_route_table" "pri_rt_a" {
  vpc_id = aws_vpc.vir-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.awesome-nat.id
  }

  tags = {
    Name = "VIR-PRD-RT-PRI-2A"
  }
  depends_on = [aws_nat_gateway.awesome-nat]
}

resource "aws_route_table" "pri_rt_c" {
  vpc_id = aws_vpc.vir-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.awesome-nat.id
  }

  tags = {
    Name = "VIR-PRD-RT-PRI-2C"
  }
  depends_on = [aws_nat_gateway.awesome-nat]
}

# rtb association
resource "aws_route_table_association" "pub_a" {
  subnet_id      = aws_subnet.pub_sub_a.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_c" {
  subnet_id      = aws_subnet.pub_sub_c.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "mgnt_sub_a" {
  subnet_id      = aws_subnet.mgnt_sub_a.id
  route_table_id = aws_route_table.pri_rt_a.id
}

resource "aws_route_table_association" "mgnt_sub_c" {
  subnet_id      = aws_subnet.mgnt_sub_c.id
  route_table_id = aws_route_table.pri_rt_c.id
}

resource "aws_route_table_association" "db_pri_a" {
  subnet_id      = aws_subnet.db_sub_a.id
  route_table_id = aws_route_table.pri_rt_a.id
}

resource "aws_route_table_association" "db_pri_c" {
  subnet_id      = aws_subnet.db_sub_c.id
  route_table_id = aws_route_table.pri_rt_c.id
}
