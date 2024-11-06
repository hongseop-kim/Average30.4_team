resource "aws_subnet" "pub_sub_a" {
  vpc_id                  = aws_vpc.vir-vpc.id
  cidr_block              = "10.240.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true # public IP 자동 할당

  tags = {
    Name = "VIR-PRD-VPC-BASTION-PUB-2A"
  }
}

resource "aws_subnet" "pub_sub_c" {
  vpc_id                  = aws_vpc.vir-vpc.id
  cidr_block              = "10.240.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true # Public IP 자동 할당

  tags = {
    Name = "VIR-PRD-VPC-PUB-2C"
  }
}

resource "aws_subnet" "pri_sub_a" {
  vpc_id                  = aws_vpc.vir-vpc.id
  cidr_block              = "10.240.50.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false # Public IP 자동 할당

  tags = {
    Name = "VIR-PRD-VPC-PRI-2A"
  }
}

resource "aws_subnet" "pri_sub_c" {
  vpc_id                  = aws_vpc.vir-vpc.id
  cidr_block              = "10.240.51.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false # Public IP 자동 할당

  tags = {
    Name = "VIR-PRD-VPC-PRI-2C"
  }
}

resource "aws_subnet" "pri_efs" {
  vpc_id                  = aws_vpc.vir-vpc.id
  cidr_block              = "10.240.52.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false # Public IP 자동 할당

  tags = {
    Name = "VIR-PRD-VPC-PRI-2A"
  }
}

resource "aws_subnet" "mgnt_sub_a" {
  vpc_id            = aws_vpc.vir-vpc.id
  cidr_block        = "10.240.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "VIR-MGNT-SUB-2A"
  }
}

resource "aws_subnet" "mgnt_sub_c" {
  vpc_id            = aws_vpc.vir-vpc.id
  cidr_block        = "10.240.21.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "VIR-MGNT-SUB-2C"
  }
}

resource "aws_subnet" "db_sub_a" {
  vpc_id            = aws_vpc.vir-vpc.id
  cidr_block        = "10.240.13.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "VIR-DB-SUB-2A"
  }
}

resource "aws_subnet" "db_sub_c" {
  vpc_id            = aws_vpc.vir-vpc.id
  cidr_block        = "10.240.23.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "VIR-DB-SUB-2C"
  }
}
