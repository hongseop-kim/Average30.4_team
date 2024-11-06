# DB 서브넷 그룹
resource "aws_db_subnet_group" "db_subnet" {
  name       = "vir-subnetgroup"
  subnet_ids = [aws_subnet.db_sub_a.id, aws_subnet.db_sub_c.id]

  tags = {
    Name = "VIR-SUBNETGROUP"
  }
}

# DB 구성
resource "aws_db_instance" "db" {
  identifier_prefix      = "vir-database"
  allocated_storage      = 10
  engine                 = "mariadb"
  engine_version         = "10.11"
  instance_class         = "db.t3.micro"
  db_name                = "work"
  username               = "admin"
  password               = "password"
  parameter_group_name   = "test-parameter"
  skip_final_snapshot    = true
  multi_az               = false
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.db_security.id]

  tags = {
    Name = "VIR-DB"
  }
}
