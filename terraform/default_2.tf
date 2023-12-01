provider "aws" {
  region = "us-west-2" # Substitua pela região desejada
}

resource "aws_ecs_cluster" "sonarqube_cluster" {
  name = "sonarqube-cluster"
}

resource "aws_ecs_task_definition" "sonarqube_task" {
  family = "sonarqube-task"

  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu    = "256" # Especifica a unidade de CPU (em milésimos) para a tarefa Fargate
  memory = "512" # Especifica a memória (em MiB) para a tarefa Fargate

  execution_role_arn = aws_iam_role.sonarqube_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name  = "sonarqube-container"
      image = "sonarqube:community"

      environment = [
        {
          name  = "SONAR_JDBC_USERNAME"
          value = "sonar"
        },
        {
          name  = "SONAR_JDBC_PASSWORD"
          value = "sonar"
        },
        {
          name  = "SONAR_JDBC_URL"
          value = "jdbc:postgresql://db:5432/sonar"
        },
        {
          name  = "sonar.search.javaAdditionalOpts"
          value = "-Dnode.store.allow_mmap=false" # Exemplo do parâmetro node.store.allow_mmap=false
        },
        # Adicione outras variáveis de ambiente conforme necessário para a configuração do SonarQube
      ]

      # Outras configurações do contêiner, como volumes, portMappings, etc., se necessário
    }
  ])
}

resource "aws_iam_role" "sonarqube_task_execution_role" {
  name               = "sonarqube-task-execution-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_ecs_service" "sonarqube_service" {
  name            = "sonarqube-service"
  cluster         = aws_ecs_cluster.sonarqube_cluster.id
  task_definition = aws_ecs_task_definition.sonarqube_task.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = ["subnet-12345678", "subnet-87654321"] # Substitua pelos IDs das subnets desejadas
    security_groups = ["sg-12345678"] # Configurações de segurança, como grupos de segurança, se necessário
  }
  # Configurações adicionais, como balanceamento de carga, auto-escalonamento, etc.
}
