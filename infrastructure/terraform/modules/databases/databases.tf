terraform {
  required_version = "=1.2.1"
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.16.0"
    }
  }
}

provider "postgresql" {
  scheme   = "awspostgres"
  host            = var.host
  port            = var.db_port
  database        = "postgres"
  username        = var.db_username
  password        = var.db_password
  sslmode         = "require"
  connect_timeout = 15
}

resource "postgresql_database" "customer" {
  name              = "customer"
  allow_connections = true
}

resource "postgresql_database" "enterprise" {
  name              = "enterprise"
  allow_connections = true
}
