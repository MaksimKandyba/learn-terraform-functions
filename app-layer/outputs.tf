output "db_deployed" {
  description = "Whether MySQL database is deployed"
  value       = data.fly_app.dbApp.deployed
}

output "db_app_name" {
  description = "MySQL database application name"
  value       = data.fly_app.dbApp.name
}
