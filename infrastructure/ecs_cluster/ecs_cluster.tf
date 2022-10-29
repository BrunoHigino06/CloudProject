#ECS cluster
resource "aws_ecs_cluster" "MainCluster" {
  name = var.MainCluster.name

  setting {
    name  = var.MainCluster.settingname
    value = var.MainCluster.settingvalue
  }

  tags = {
    name = var.MainCluster.name
    environment = var.MainCluster.environment
  }
}