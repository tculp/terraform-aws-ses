# smtp-user

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.14 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.14 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.send_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.send_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_ssm_parameter.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.username](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_id.policy_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_iam_policy_document.send_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ssm_password_path"></a> [ssm\_password\_path](#input\_ssm\_password\_path) | The path in SSM where the SMTP password should be placed. Not used if left as null. | `string` | `null` | no |
| <a name="input_ssm_username_path"></a> [ssm\_username\_path](#input\_ssm\_username\_path) | The path in SSM where the SMTP username should be placed. Not used if left as null. | `string` | `null` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the IAM user to create. This will NOT be the resulting SMTP username, see output `smtp_username`. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_smtp_password"></a> [smtp\_password](#output\_smtp\_password) | The password of the SMTP user. |
| <a name="output_smtp_username"></a> [smtp\_username](#output\_smtp\_username) | The username of the SMTP user. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
