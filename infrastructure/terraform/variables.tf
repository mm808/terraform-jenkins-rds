variable "env" {
  description = "environment we are deploying to"
  type        = string
}

variable "account" {
  description = "aws account"
  type        = number
}

variable "app-name" {
  description = "app name"
  type        = string
  default     = "pigeon-api"
}

variable "app-region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "owner" {
  description = "app owner"
  type        = string
  default     = "ConnectTeam"
}

variable "vpc-id" {
  description = "vpc for the pigeon-api"
  type        = string
}

# db specific vars #
variable "db-identifier" {
  description = "logical name for the database"
  type        = string
}

variable "engine" {
  description = "db engine name"
  type        = string
}

variable "engine_version" {
  description = "db engine version"
  type        = string
}

variable "family" {
  description = "db family"
  type        = string
}

variable "major_engine_version" {
  description = "db major version"
  type        = string
}

variable "instance_class" {
  description = "db instance class"
  type        = string
}

variable "allocated_storage" {
  description = "db allocated storage"
  type        = number
}

variable "max_allocated_storage" {
  description = "max_allocated_storage"
  type        = number
}

variable "db_port" {
  description = "db port"
  type        = number
  default     = 5432
}

variable "multi_az" {
  description = "multi az db setting"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "do not create final snapshot on delete"
  type        = bool
}

variable "db_subnet_group_name" {
  description = "db subnet group name"
  type        = string
}

variable "monitoring_role_arn" {
  description = "db enhanced monitoring role"
  type        = string
}

variable "vpc_cidr" {
  description = "cidr block of vpc"
  type        = list(string)
}

variable "ent-db-name" {
  description = "enterprise db name"
  type        = string
  default     = "enterprise"
}

variable "cust-db-name" {
  description = "customer db name"
  type        = string
  default     = "customer"
}
