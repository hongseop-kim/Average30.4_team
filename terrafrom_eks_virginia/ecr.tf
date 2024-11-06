resource "aws_ecr_repository" "ecr-main" {
  name                 = "mainnginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-MAINNGINX"
  }
}

resource "aws_ecr_repository" "ecr-maintomcat" {
  name                 = "maintomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-MAINTOMCAT"
  }
}

resource "aws_ecr_repository" "ecr-login" {
  name                 = "loginnginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-LOGINNGINX"
  }
}

resource "aws_ecr_repository" "ecr-logintomcat" {
  name                 = "logintomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-LOGINTOMCAT"
  }
}

resource "aws_ecr_repository" "ecr-signup" {
  name                 = "signupnginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-SIGNUPNGINX"
  }
}

resource "aws_ecr_repository" "ecr-signuptomcat" {
  name                 = "signuptomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-SIGNUPTOMCAT"
  }
}

resource "aws_ecr_repository" "ecr-menu" {
  name                 = "menunginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-MENUNGINX"
  }
}

resource "aws_ecr_repository" "ecr-menutomcat" {
  name                 = "menutomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-MENUTOMCAT"
  }
}

resource "aws_ecr_repository" "ecr-mypage" {
  name                 = "mypagenginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-MYPAGENGINX"
  }
}

resource "aws_ecr_repository" "ecr-mypagetomcat" {
  name                 = "mypagetomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "VIR-MYPAGETOMCAT"
  }
}
