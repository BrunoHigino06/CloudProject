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

continue from here