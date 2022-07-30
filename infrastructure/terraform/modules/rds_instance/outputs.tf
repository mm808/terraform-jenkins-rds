output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.api-db.address
}

output "db_instance_user" {
  description = "the db user name"
  value = local.db_creds.DB_USER
}

output "db_instance_psswd" {
  description = "the db psswd"
  value = local.db_creds.DB_PASSWORD
}
