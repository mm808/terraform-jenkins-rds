variable "env" {
  description = "environment"
  type = string
}

variable "app-name" {
  description = "app name"
  type = string
}

variable "app-region" {
  description = "aws region"
  type        = string
}

variable "owner" {
  description = "app owner"
  type = string
}

variable "vpc-id" {
  description = "vpc for the pigeon-api"
  type        = string
}

variable "db-identifier" {
  description = "logical name for the database"
  type        = string
}

variable "engine" {
  description = "db engine name"
  type = string
}

variable "engine_version" {
  description = "db engine version"
  type = string
}

variable "family" {
  description = "db family"
  type = string
}

variable "major_engine_version" {
  description = "db major version"
  type = string
}

variable "instance_class" {
  description = "db instance class"
  type = string
}

variable "allocated_storage" {
  description = "db allocated storage"
  type =  number
}

variable "max_allocated_storage" {
  description = "max_allocated_storage"
  type = number
}

variable "db_port" {
  description = "db port"
  type = number
}

variable "multi_az" {
  description = "multi az db setting"
  type = bool
}

variable "skip_final_snapshot" {
  description = "do not create final snapshot on delete"
  type = bool
}

variable "db_subnet_group_name" {
  description = "db subnet group name"
  type = string
}

variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  type    = list(string)
}

variable "maintenance_window" {
  description = "db maintenance window"
  type = string
}

variable "backup_window" {
  description = "db backup window"
  type = string
}

variable "backup_retention_period" {
  description = "db backup retention period"
  type = string
}

variable "performance_insights_enabled" {
  description = "performance insights setting"
  type = string
}

variable "performance_insights_retention_period" {
  description = "performance insights retention period in days"
  type = string
}

variable "monitoring_interval" {
  description = "monitoring interval"
  type = string
}

variable "monitoring_role_arn" {
  description = "db monitoring role name"
  type = string
}

variable "enabled_cloudwatch_logs_exports" {
  description = "cloudwatch log types to create"
  type    = list(string)
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "number of days to keep cloudwatch logs"
  type = number  
}
