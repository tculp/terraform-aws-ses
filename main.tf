################################################################################
# Data
################################################################################

data "aws_route53_zone" "selected" {
  provider = aws.route53

  name = local.hosted_zone_name
}

data "aws_region" "current" {}

################################################################################
# Locals
################################################################################

locals {
  hosted_zone_name = coalesce(var.hosted_zone_name, var.domain)
  create_smtp_user = var.create_smtp_user && var.user_name != null
}

################################################################################
# SMTP User
################################################################################

module "smtp_user" {
  count = local.create_smtp_user ? 1 : 0

  source = "./modules/smtp-user"

  user_name         = var.user_name
  ssm_username_path = var.ssm_username_path
  ssm_password_path = var.ssm_password_path
}
