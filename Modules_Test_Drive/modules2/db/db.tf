resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  availability_zone = var.db_az
  db_subnet_group_name = aws_db_subnet_group.subnet_group.id
  vpc_security_group_ids = [var.private_sg_db]
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [var.private_subnet_1_db, var.private_subnet_2_db]

  tags = {
    Name = "My DB subnet group"
  }
}