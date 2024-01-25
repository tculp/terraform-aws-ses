variable "domain" {
  type        = string
  description = "The domain to verify."
}

variable "hosted_zone_name" {
  type        = string
  description = "The name of the hosted zone to create records in, if different from the domain."
  default     = null
}

################################################################################
# SMTP User
################################################################################

variable "create_smtp_user" {
  type        = bool
  description = "Whether to create a user with SMTP access."
  default     = false
}

variable "user_name" {
  type        = string
  description = "The name of the IAM user to create. This will NOT be the resulting SMTP username, see output `smtp_username`."
  default     = null
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
