resource "aws_ecr_repository" "ecr-main" {
  name                 = "seo-main-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-MAINNGINX"
  }
}

resource "aws_ecr_repository" "ecr-maintomcat" {
  name                 = "seo-main-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-MAINTOMCAT"
  }
}

resource "aws_ecr_repository" "ecr-login" {
  name                 = "seo-login-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-LOGINNGINX"
  }
}

resource "aws_ecr_repository" "ecr-logintomcat" {
  name                 = "seo-login-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-LOGINTOMCAT"
  }
}

resource "aws_ecr_repository" "ecr-signup" {
  name                 = "seo-signup-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-SIGNUPNGINX"
  }
}

resource "aws_ecr_repository" "ecr-signuptomcat" {
  name                 = "seo-signup-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-SIGNUPTOMCAT"
  }
}

resource "aws_ecr_repository" "ecr-menu" {
  name                 = "seo-menu-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-MENUNGINX"
  }
}

resource "aws_ecr_repository" "ecr-menutomcat" {
  name                 = "seo-menu-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-MENUTOMCAT"
  }
}

resource "aws_ecr_repository" "ecr-mypage" {
  name                 = "seo-mypage-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-MYPAGENGINX"
  }
}

resource "aws_ecr_repository" "ecr-mypagetomcat" {
  name                 = "seo-mypage-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-PRD-MYPAGETOMCAT"
  }
}


resource "aws_ecr_repository" "dev-ecr-main" {
  name                 = "seo-dev-main-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-MAINNGINX"
  }
}

resource "aws_ecr_repository" "dev-ecr-maintomcat" {
  name                 = "seo-dev-main-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-MAINTOMCAT"
  }
}

resource "aws_ecr_repository" "dev-ecr-login" {
  name                 = "seo-dev-login-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-LOGINNGINX"
  }
}

resource "aws_ecr_repository" "dev-ecr-logintomcat" {
  name                 = "seo-dev-login-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-LOGINTOMCAT"
  }
}

resource "aws_ecr_repository" "dev-ecr-signup" {
  name                 = "seo-dev-signup-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-SIGNUPNGINX"
  }
}

resource "aws_ecr_repository" "dev-ecr-signuptomcat" {
  name                 = "seo-dev-signup-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-SIGNUPTOMCAT"
  }
}

resource "aws_ecr_repository" "dev-ecr-menu" {
  name                 = "seo-dev-menu-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-MENUNGINX"
  }
}

resource "aws_ecr_repository" "dev-ecr-menutomcat" {
  name                 = "seo-dev-menu-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-MENUTOMCAT"
  }
}

resource "aws_ecr_repository" "dev-ecr-mypage" {
  name                 = "seo-dev-mypage-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-MYPAGENGINX"
  }
}

resource "aws_ecr_repository" "dev-ecr-mypagetomcat" {
  name                 = "seo-dev-mypage-tomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "SEO-DEV-MYPAGETOMCAT"
  }
}
