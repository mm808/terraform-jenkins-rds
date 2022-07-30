resource "random_password" "db-password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_secretsmanager_secret" "api-db-username-password" {
  name = "/pigeon-api/db-username-password/${var.env}"
  description = "secret values for ${var.env} pigeon-api db"
}

resource "aws_secretsmanager_secret_version" "api-db-username-password" {
  secret_id     = aws_secretsmanager_secret.api-db-username-password.id
  secret_string = <<EOF
   {
    "DB_USER": "pigeonapi_postgresql",
    "DB_PASSWORD": "${random_password.db-password.result}"
   }
EOF
}

data "aws_secretsmanager_secret" "api-db-username-password" {
  arn = aws_secretsmanager_secret.api-db-username-password.arn
}

data "aws_secretsmanager_secret_version" "api-db-username-password" {
  secret_id = data.aws_secretsmanager_secret.api-db-username-password.id
  depends_on = [aws_secretsmanager_secret_version.api-db-username-password]
}