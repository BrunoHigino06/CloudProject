#Password for the database
resource "random_password" "dbpassword" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
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
1 criar o rds