#ECS cluster
resource "aws_ecs_cluster" "MainCluster" {
  name = var.ClusterName

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    name = var.ClusterName
    environment = "production"
  }
}