output "dbname" {
  value = aws_db_instance.db-instance.db_name
}

output "dbuser" {
  value = aws_db_instance.db-instance.username
}

output "dbpassword" {
  value = aws_db_instance.db-instance.password
}

output "dbengine" {
  value = aws_db_instance.db-instance.engine
}