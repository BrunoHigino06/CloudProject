resource "aws_ecr_repository" "BlogmainRepo" {
  name                 = var.BlogmainRepo.name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "Environment" = var.BlogmainRepo.Environment
  }
}

1 para fazer o docker build e preciso criar a database primeiro