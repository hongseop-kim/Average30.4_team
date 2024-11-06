# Key (ssh-keygen -m PEM -f awesomekey)
resource "aws_key_pair" "key" {
  key_name   = "yoowonjongkey"
  public_key = file("yoowonjongkey.pub")
}


# Public에 Bastion Instance 생성
resource "aws_instance" "bastion" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t2.micro"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_c.id

  tags = {
    Name = "SEO-PRD-BASTION-SERVER-2C"
  }
}

# Private에 k8s-managed Server 생성
resource "aws_instance" "k8s-managed-Server" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.private_security.id]
  subnet_id              = aws_subnet.pri_sub_a.id

  tags = {
    Name = "SEO-PRD-MANAGED-SERVER-2A"
  }
}

# Private에 k8s-efs Server 생성
resource "aws_instance" "k8s-efs-Server" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.efs_security.id]
  subnet_id              = aws_subnet.pri_sub_c.id

  tags = {
    Name = "SEO-PRD-EFS-SERVER-2C"
  }
}

# Private에 k8s-argocd Server 생성
resource "aws_instance" "k8s-argocd-Server" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.efs_security.id]
  subnet_id              = aws_subnet.pri_sub_a.id

  tags = {
    Name = "SEO-PRD-ARGOCD-SERVER-2A"
  }
}

data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "^amzn2-"

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Public에 Bastion Instance 생성
resource "aws_instance" "dev-bastion" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t2.micro"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.dev_bastion_security.id]
  subnet_id              = aws_subnet.dev_pub_sub_c.id

  tags = {
    Name = "SEO-DEV-BASTION-SERVER-2C"
  }
}

# Private에 k8s-managed Server 생성
resource "aws_instance" "k8s-dev-managed-Server" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.dev_private_security.id]
  subnet_id              = aws_subnet.dev_pri_sub_a.id

  tags = {
    Name = "SEO-DEV-MANAGED-SERVER-2A"
  }
}

# Private에 k8s-efs Server 생성
resource "aws_instance" "k8s-dev-efs-Server" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.dev_efs_security.id]
  subnet_id              = aws_subnet.dev_pri_sub_c.id

  tags = {
    Name = "SEO-DEV-EFS-SERVER-2C"
  }
}

# Private에 k8s-argocd Server 생성
resource "aws_instance" "k8s-dev-argocd-Server" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.dev_efs_security.id]
  subnet_id              = aws_subnet.dev_pri_sub_a.id

  tags = {
    Name = "SEO-DEV-ARGOCD-SERVER-2A"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
