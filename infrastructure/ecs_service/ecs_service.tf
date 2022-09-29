resource "aws_ecs_service" "MainService" {
  name            = var.service_names
  cluster         = aws_ecs_cluster.foo.id
  task_definition = aws_ecs_task_definition.mongo.arn
  desired_count   = 1
  iam_role        = aws_iam_role.foo.arn


  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "mongo"
    container_port   = 8080
  }
}