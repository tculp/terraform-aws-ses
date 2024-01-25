################################################################################
# Data
################################################################################

data "aws_iam_policy_document" "send_email" {
  statement {
    actions = [
      "ses:SendEmail",
      "ses:SendRawEmail"
    ]

    resources = ["*"]
  }
}

################################################################################
# Locals
################################################################################

locals {
  random_id = random_id.policy_name.dec
}

################################################################################
# Resources
################################################################################

resource "random_id" "policy_name" {
  byte_length = 8
}

resource "aws_iam_policy" "send_email" {
  name        = "${var.user_name}-${local.random_id}"
  description = "Allow the user to send emails using SES."
  policy      = data.aws_iam_policy_document.send_email.json
}

resource "aws_iam_user" "this" {
  name = var.user_name
}

resource "aws_iam_user_policy_attachment" "send_email" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.send_email.arn
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

################################################################################
# SSM
################################################################################

resource "aws_ssm_parameter" "username" {
  count = var.ssm_username_path != null ? 1 : 0

  name        = var.ssm_username_path
  description = "The SMTP username for the ${var.user_name} IAM user."
  type        = "String"
  value       = aws_iam_access_key.this.id
}

resource "aws_ssm_parameter" "password" {
  count = var.ssm_password_path != null ? 1 : 0

  name        = var.ssm_password_path
  description = "The SMTP password for the ${var.user_name} IAM user."
  type        = "SecureString"
  value       = aws_iam_access_key.this.ses_smtp_password_v4
}
