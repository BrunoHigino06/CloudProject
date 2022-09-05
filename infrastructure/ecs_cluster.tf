#ECS cluster
resource "aws_ecs_cluster" "MainCluster" {
  count = length(var.ClusterName)
  name = var.ClusterName[count.index]

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    name = var.ClusterName[count.index]
    environment = "production"
  }
}