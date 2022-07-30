locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.api-db-username-password.secret_string)
}

resource "aws_db_instance" "api-db" {
  identifier = var.db-identifier
  username                            = local.db_creds.DB_USER
  password                            = local.db_creds.DB_PASSWORD
  
  engine            = var.engine
  engine_version    = var.engine_version

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  port                                = var.db_port
  multi_az            = var.multi_az
  skip_final_snapshot = var.skip_final_snapshot
  
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  
  maintenance_window          = var.maintenance_window
  backup_window           = var.backup_window
  backup_retention_period = var.backup_retention_period

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  monitoring_interval    = var.monitoring_interval
  monitoring_role_arn = var.monitoring_role_arn

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  
  provisioner "local-exec" {
    command = "aws logs put-retention-policy --log-group-name /aws/rds/instance/api-db-${var.env}/postgresql --retention-in-days 7"
  }
}
