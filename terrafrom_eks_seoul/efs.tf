resource "aws_efs_file_system" "efs" {
  creation_token   = "my-efs"         # EFS를 구분할 수 있는 고유 토큰
  performance_mode = "generalPurpose" # 성능 모드 설정
  encrypted        = false            # 암호화 활성화
}

resource "aws_efs_mount_target" "efs_mt" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = aws_subnet.pub_sub_c.id        # 서브넷 ID 설정
  security_groups = [aws_security_group.efs_sg.id] # EFS에 적용할 보안 그룹
}

resource "aws_security_group" "efs_sg" {
  name   = "SEO-EFS_SG"
  vpc_id = aws_vpc.seo-vpc.id # VPC ID 설정

  ingress {
    from_port   = 2049 # NFS 포트
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # 모든 IP 허용 (보안에 주의!)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_efs_file_system" "dev_efs" {
  creation_token   = "my-dev-efs"     # EFS를 구분할 수 있는 고유 토큰
  performance_mode = "generalPurpose" # 성능 모드 설정
  encrypted        = false            # 암호화 활성화
}

resource "aws_efs_mount_target" "dev_efs_mt" {
  file_system_id  = aws_efs_file_system.dev_efs.id
  subnet_id       = aws_subnet.dev_pub_sub_c.id        # 서브넷 ID 설정
  security_groups = [aws_security_group.dev_efs_sg.id] # EFS에 적용할 보안 그룹
}

resource "aws_security_group" "dev_efs_sg" {
  name   = "SEO-DEV_EFS_SG"
  vpc_id = aws_vpc.dev_vpc.id # VPC ID 설정

  ingress {
    from_port   = 2049 # NFS 포트
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # 모든 IP 허용 (보안에 주의!)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
