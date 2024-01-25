variable "user_name" {
  type        = string
  description = "The name of the IAM user to create. This will NOT be the resulting SMTP username, see output `smtp_username`."
}

variable "ssm_username_path" {
  type        = string
  description = "The path in SSM where the SMTP username should be placed. Not used if left as null."
  default     = null
}

variable "ssm_password_path" {
  type        = string
  description = "The path in SSM where the SMTP password should be placed. Not used if left as null."
  default     = null
}
