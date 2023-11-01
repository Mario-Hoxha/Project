resource "aws_db_subnet_group" "dbsubnet" {
  name = "${var.app_name}subdb"
  subnet_ids = var.subnets
}

resource "aws_db_parameter_group" "pam-db" {
  family = "postgres13"
}

resource "aws_security_group" "sec-grup" {
    vpc_id = var.vpc_id
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }
}

resource "aws_db_instance" "db-instance" {
  skip_final_snapshot = true
  instance_class = "db.t3.micro"
  allocated_storage = 20
  db_name = var.DbName
  engine = var.DbEngine
  identifier = "${var.app_name}-db-instance"
  engine_version = "13"
  db_subnet_group_name = aws_db_subnet_group.dbsubnet.name
  parameter_group_name = aws_db_parameter_group.pam-db.name
  vpc_security_group_ids = [aws_security_group.sec-grup.id]
  username = var.DbUser
  password = var.DbPassword
}