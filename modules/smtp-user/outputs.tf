output "smtp_username" {
  value       = aws_iam_access_key.this.id
  description = "The username of the SMTP user."
}

output "smtp_password" {
  value       = aws_iam_access_key.this.ses_smtp_password_v4
  description = "The password of the SMTP user."
}
