# Key (ssh-keygen -m PEM -f awesomekey)
resource "aws_key_pair" "key" {
  key_name   = "yoowonjongkey"
  public_key = file("yoowonjongkey.pub")
}


# Public에 loadbalancer 생성
resource "aws_instance" "loadbalancer" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id, var.image_id)
  instance_type          = "t2.micro"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_c.id

  tags = {
    Name = "VIR-LOADBALANCER"
  }
}

# Public에 k8s-master-node1 생성
resource "aws_instance" "k8s-master-node1" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_a.id

  tags = {
    Name = "VIR-MASTER-NODE1"
  }
}

# Public에 k8s-master-node2 생성
resource "aws_instance" "k8s-master-node2" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_a.id

  tags = {
    Name = "VIR-MASTER-NODE2"
  }
}

# Public에 k8s-master-node3 생성
resource "aws_instance" "k8s-master-node3" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_a.id

  tags = {
    Name = "VIR-MASTER-NODE3"
  }
}

# Public에 k8s-worker-node1 생성
resource "aws_instance" "k8s-worker-node1" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_c.id

  tags = {
    Name = "VIR-WORKER-NODE1"
  }
}

# Public에 k8s-worker-node2 생성
resource "aws_instance" "k8s-worker-node2" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_c.id

  tags = {
    Name = "VIR-WORKER-NODE2"
  }
}

# Public에 k8s-worker-node3 생성
resource "aws_instance" "k8s-worker-node3" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_c.id

  tags = {
    Name = "VIR-WORKER-NODE3"
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
