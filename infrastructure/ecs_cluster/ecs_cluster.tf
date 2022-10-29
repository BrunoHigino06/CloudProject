#ECS cluster
resource "aws_ecs_cluster" "MainCluster" {
  name = var.ClusterName

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    name = var.ClusterName
    environment = "production"
  }
}