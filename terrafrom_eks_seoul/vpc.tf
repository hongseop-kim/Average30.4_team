# VPC 생성
resource "aws_vpc" "seo-vpc" {
  cidr_block           = "10.250.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "SEO-PRD-VPC"
  }
}

# IGW 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = resource.aws_vpc.seo-vpc.id
  tags = {
    Name = "SEO-PRD-IGW"
  }
}

# EIP 생성
resource "aws_eip" "awesome-bastion-eip" {
  instance = aws_instance.bastion.id
  vpc      = true

  tags = {
    Name = "SEO-PRD-NGW-2A-EIP"
  }
}

resource "aws_eip" "awesome-nat-eip" {
  vpc = true

  tags = {
    Name = "SEO-PRD-NGW-2C-EIP"
  }
}

# NAT 생성
resource "aws_nat_gateway" "awesome-nat" {
  allocation_id = aws_eip.awesome-nat-eip.id
  subnet_id     = aws_subnet.pub_sub_c.id

  tags = {
    Name = "SEO-PRD-NGW-2A"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


# Public rtb
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.seo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "SEO-PRD-RT-PUB"
  }
}

# Private rtb
resource "aws_route_table" "pri_rt_a" {
  vpc_id = aws_vpc.seo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.awesome-nat.id
  }

  tags = {
    Name = "SEO-PRD-RT-PRI-2A"
  }
  depends_on = [aws_nat_gateway.awesome-nat]
}

resource "aws_route_table" "pri_rt_c" {
  vpc_id = aws_vpc.seo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.awesome-nat.id
  }

  tags = {
    Name = "SEO-PRD-RT-PRI-2C"
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

resource "aws_route_table_association" "pri_a" {
  subnet_id      = aws_subnet.pri_sub_a.id
  route_table_id = aws_route_table.pri_rt_a.id
}

resource "aws_route_table_association" "pri_c" {
  subnet_id      = aws_subnet.pri_sub_c.id
  route_table_id = aws_route_table.pri_rt_c.id
}



resource "aws_route_table_association" "node_sub_a" {
  subnet_id      = aws_subnet.node_sub_a.id
  route_table_id = aws_route_table.pri_rt_a.id
}

resource "aws_route_table_association" "node_sub_c" {
  subnet_id      = aws_subnet.node_sub_c.id
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

# VPC 생성
resource "aws_vpc" "dev_vpc" {
  cidr_block           = "10.230.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "SEO-DEV-VPC"
  }
}

# IGW 생성
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name = "SEO-DEV-IGW"
  }
}

# EIP 생성
resource "aws_eip" "dev-bastion_eip" {
  instance = aws_instance.dev-bastion.id
  vpc      = true

  tags = {
    Name = "SEO-DEV-NGW-2A-EIP"
  }
}

resource "aws_eip" "dev-nat_eip" {
  vpc = true

  tags = {
    Name = "SEO-DEV-NGW-2C-EIP"
  }
}

# NAT 생성
resource "aws_nat_gateway" "awesome-dev-nat" {
  allocation_id = aws_eip.dev-nat_eip.id
  subnet_id     = aws_subnet.dev_pub_sub_c.id

  tags = {
    Name = "SEO-DEV-NGW-2A"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.dev_igw]
}


# Public rtb
resource "aws_route_table" "dev_pub_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name = "SEO-DEV-RT-PUB"
  }
}

# Private rtb
resource "aws_route_table" "dev_pri_rt_a" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.awesome-dev-nat.id
  }

  tags = {
    Name = "SEO-DEV-RT-PRI-2A"
  }
  depends_on = [aws_nat_gateway.awesome-dev-nat]
}

resource "aws_route_table" "dev_pri_rt_c" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.awesome-dev-nat.id
  }

  tags = {
    Name = "SEO-DEV-RT-PRI-2C"
  }
  depends_on = [aws_nat_gateway.awesome-dev-nat]
}

# rtb association
resource "aws_route_table_association" "dev_pub_a" {
  subnet_id      = aws_subnet.dev_pub_sub_a.id
  route_table_id = aws_route_table.dev_pub_rt.id
}

resource "aws_route_table_association" "dev_pub_c" {
  subnet_id      = aws_subnet.dev_pub_sub_c.id
  route_table_id = aws_route_table.dev_pub_rt.id
}



resource "aws_route_table_association" "dev_node_sub_a" {
  subnet_id      = aws_subnet.dev_node_sub_a.id
  route_table_id = aws_route_table.dev_pri_rt_a.id
}

resource "aws_route_table_association" "dev_node_sub_c" {
  subnet_id      = aws_subnet.dev_node_sub_c.id
  route_table_id = aws_route_table.dev_pri_rt_c.id
}

resource "aws_route_table_association" "dev_db_pri_a" {
  subnet_id      = aws_subnet.dev_db_sub_a.id
  route_table_id = aws_route_table.dev_pri_rt_a.id
}

resource "aws_route_table_association" "dev_db_pri_c" {
  subnet_id      = aws_subnet.dev_db_sub_c.id
  route_table_id = aws_route_table.dev_pri_rt_c.id
}

resource "aws_route_table_association" "dev_pri_a" {
  subnet_id      = aws_subnet.dev_pri_sub_a.id
  route_table_id = aws_route_table.dev_pri_rt_a.id
}

resource "aws_route_table_association" "dev_pri_c" {
  subnet_id      = aws_subnet.dev_pri_sub_c.id
  route_table_id = aws_route_table.dev_pri_rt_a.id
}
