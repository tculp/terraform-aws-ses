output "smtp_username" {
  value       = local.create_smtp_user ? module.smtp_user[0].smtp_username : null
  description = "The SMTP username of the user created."
}

output "smtp_password" {
  value       = local.create_smtp_user ? module.smtp_user[0].smtp_password : null
  description = "The SMTP password of the user created."
}
