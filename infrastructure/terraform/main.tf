# config terraform
terraform {
  required_version = "=1.2.1"
  backend "s3" {}
}

# config provider
provider "aws" {
  region = var.app-region
  default_tags {
    tags = {
      App         = var.app-name
      Environment = var.env
      Owner       = var.owner
      terraform   = "true"
    }
  }
}

module "network" {
  source = "./modules/network"

  vpc-id   = var.vpc-id
  env      = var.env
  vpc_cidr = var.vpc_cidr
}

module "rds_instance" {
  source = "./modules/rds_instance"

  env                                   = var.env
  app-name                              = var.app-name
  app-region                            = var.app-region
  owner                                 = var.owner
  vpc-id                                = var.vpc-id
  db-identifier                         = var.db-identifier
  engine                                = var.engine
  engine_version                        = var.engine_version
  family                                = var.family
  major_engine_version                  = var.major_engine_version
  instance_class                        = var.instance_class
  allocated_storage                     = var.allocated_storage
  max_allocated_storage                 = var.max_allocated_storage
  db_port                               = var.db_port
  multi_az                              = var.multi_az
  skip_final_snapshot                   = var.skip_final_snapshot
  db_subnet_group_name                  = var.db_subnet_group_name
  vpc_security_group_ids                = [module.network.api-db-sg]
  maintenance_window                    = "Sun:00:00-Sun:03:00"
  backup_window                         = "03:00-06:00"
  backup_retention_period               = 1
  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  monitoring_interval                   = "60"
  monitoring_role_arn                   = var.monitoring_role_arn

  enabled_cloudwatch_logs_exports        = ["postgresql"]
  cloudwatch_log_group_retention_in_days = 7
}

module "databases" {
  source = "./modules/databases"

  host        = module.rds_instance.db_instance_address
  db_port     = var.db_port
  db_username = module.rds_instance.db_instance_user
  db_password = module.rds_instance.db_instance_psswd
}
