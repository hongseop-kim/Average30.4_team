# bastion security group
resource "aws_security_group" "bastion_security" {
  name        = "SEO-PRD-VPC-BASTION-PUB-SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.seo-vpc.id # 내가 생성한 VPC

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SEO-PRD-VPC-BASTION-PUB-SG-2A"
  }
}



# monitoring security group
/*resource "aws_security_group" "monitoring_security" {
  name        = "monitoring"
  description = "Allow ALL traffic"
  vpc_id      = aws_vpc.vpc.id # 내가 생성한 VPC

  ingress {
    description = "ALL traffic from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "awesome-monitoring-sg"
  }
} */

resource "aws_security_group" "db_security" {
  name_prefix = "SEO-PRD-PRI-DB-SG"
  description = "Allow db inbound traffic"
  vpc_id      = aws_vpc.seo-vpc.id # 내가 생성한 VPC

  ingress {
    description = "mysql from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SEO-PRD-PRI-DB-SG"
  }
}

resource "aws_security_group" "dms_security" {
  name_prefix = "SEO-PRD-PRI-DMS-SG"
  description = "Allow db inbound traffic"
  vpc_id      = aws_vpc.seo-vpc.id # 내가 생성한 VPC

  ingress {
    description = "mysql from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SEO-PRD-PRI-DB-SG"
  }
}

resource "aws_security_group" "private_security" {
  name        = "SEO-PRD-VPC-PRI-SG"
  description = "Allow HTTP,HTTPS inbound traffic"
  vpc_id      = aws_vpc.seo-vpc.id # 내가 생성한 VPC

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SEO-PRD-VPC-PRI-SG"
  }
}

resource "aws_security_group" "efs_security" {
  name        = "SEO-PRD-EFS-SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.seo-vpc.id # 내가 생성한 VPC

  ingress {
    description = "SSH from VPC"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SEO-PRD-EFS-SG"
  }
}

resource "aws_security_group" "redis_security" {
  name        = "SEO-PRD-REDIS-SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.seo-vpc.id # 내가 생성한 VPC

  ingress {
    description = "SSH from VPC"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SEO-PRD-REDIS-SG"
  }
}

# bastion security group
resource "aws_security_group" "dev_bastion_security" {
  name        = "SEO-DEV-VPC-BASTION-PUB-SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id # 내가 생성한 VPC

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SEO-DEV-VPC-BASTION-PUB-SG-2A"
  }
}


# monitoring security group
/*resource "aws_security_group" "monitoring_security" {
  name        = "monitoring"
  description = "Allow ALL traffic"
  vpc_id      = aws_vpc.vpc.id # 내가 생성한 VPC

  ingress {
    description = "ALL traffic from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "awesome-monitoring-sg"
  }
} */

resource "aws_security_group" "dev_db_security" {
  name_prefix = "SEO-DEV-PRI-DB-SG"
  description = "Allow db inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id # 내가 생성한 VPC

  ingress {
    description = "mysql from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SEO-DEV-PRI-DB-SG"
  }
}

resource "aws_security_group" "dev_dms_security" {
  name_prefix = "SEO-DEV-PRI-DMS-SG"
  description = "Allow db inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id # 내가 생성한 VPC

  ingress {
    description = "mysql from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SEO-DEV-PRI-DB-SG"
  }
}

resource "aws_security_group" "dev_private_security" {
  name        = "SEO-DEV-VPC-PRI-SG"
  description = "Allow HTTP,HTTPS inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id # 내가 생성한 VPC

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SEO-DEV-VPC-PRI-SG"
  }
}

resource "aws_security_group" "dev_efs_security" {
  name        = "SEO-DEV-EFS-SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id # 내가 생성한 VPC

  ingress {
    description = "SSH from VPC"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SEO-DEV-EFS-SG"
  }
}

resource "aws_security_group" "dev_redis_security" {
  name        = "SEO-DEV-REDIS-SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id # 내가 생성한 VPC

  ingress {
    description = "SSH from VPC"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SEO-DEV-REDIS-SG"
  }
}
