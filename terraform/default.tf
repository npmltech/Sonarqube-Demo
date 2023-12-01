provider "aws" {
  region = "us-west-2" # Substitua pela região desejada
}

resource "aws_ecs_cluster" "sonarqube_cluster" {
  name = "sonarqube-cluster"
}

resource "aws_ecs_task_definition" "sonarqube_task" {
  family                   = "sonarqube-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]  # Use Fargate ou EC2 conforme a sua preferência

  container_definitions = jsonencode([
    {
      name  = "sonarqube-container"
      image = "sonarqube:community"

      # Configurações específicas do SonarQube, como portas, variáveis de ambiente, etc.
      portMappings = [
        {
          containerPort = 9000  # Porta do SonarQube
          hostPort      = 9000  # Porta do host (pode ser diferente se necessário)
        }
      ]
      # ... outras configurações do container, se for necessário
    }
  ])
}

resource "aws_ecs_service" "sonarqube_service" {
  name            = "sonarqube-service"
  cluster         = aws_ecs_cluster.sonarqube_cluster.id
  task_definition = aws_ecs_task_definition.sonarqube_task.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = ["subnet-12345678", "subnet-87654321"]  # Substitua pelos IDs das subnets desejadas
    security_groups = ["sg-12345678"] # Configurações de segurança, como grupos de segurança, se necessário
  }

  # Configurações adicionais...
}
