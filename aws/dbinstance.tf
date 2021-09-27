resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = var.name
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql5.7" 
  skip_final_snapshot  = true
  backup_retention_period = 0
  apply_immediately    = true
  publicly_accessible  = true  
  vpc_security_group_ids    = [aws_security_group.rds.id]
}