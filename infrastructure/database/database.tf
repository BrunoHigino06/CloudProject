#Password for the database
resource "random_password" "dbpassword" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_string" "dbpusername" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

#Secret to achive the db password
resource "aws_ssm_parameter" "dbPasswordSecret" {
  name  = var.dbPasswordSecret.name
  type  = var.dbPasswordSecret.type
  value = random_password.dbpassword.result

  tags = {
    "Environment" = var.dbPasswordSecret.Environment
  }
}

#Secret to achive the db username
resource "aws_ssm_parameter" "dbusernameSecret" {
  name  = var.dbusernameSecret.name
  type  = var.dbusernameSecret.type
  value = random_password.dbpusername.result

  tags = {
    "Environment" = var.dbusernameSecret.Environment
  }
}

#RDS instance
resource "aws_db_instance" "blogDB" {
  allocated_storage    = var.blogDB.allocated_storage
  db_name              = var.blogDB.db_name
  engine               = var.blogDB.engine
  engine_version       = var.blogDB.engine_version
  instance_class       = var.blogDB.instance_class
  username             = aws_ssm_parameter.dbusernameSecret.value
  password             = aws_ssm_parameter.dbPasswordSecret.value
  parameter_group_name = var.blogDB.parameter_group_name
  storage_type         = var.blogDB.storage_type
  skip_final_snapshot  = true


  tags = {
    "Environment" = var.blogDB.Environment
  }
}