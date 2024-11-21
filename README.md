# Terraform-AWS-SES

This module can be used to create a DKIM-verified domain in SES, as well as a user which is able to send emails.

Two AWS providers are used, as Route53 and SES are both not available in all regions.

`aws` is the provider alias which will be used for SES and IAM.
`aws.route53` is the provider alias which will be used for Route53.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.14 |
| <a name="provider_aws.route53"></a> [aws.route53](#provider\_aws.route53) | ~> 5.14 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_smtp_user"></a> [smtp\_user](#module\_smtp\_user) | ./modules/smtp-user | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_ses_domain_dkim.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_domain_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_domain_identity_verification.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity_verification) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_smtp_user"></a> [create\_smtp\_user](#input\_create\_smtp\_user) | Whether to create a user with SMTP access. | `bool` | `false` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain to verify. | `string` | n/a | yes |
| <a name="input_hosted_zone_name"></a> [hosted\_zone\_name](#input\_hosted\_zone\_name) | The name of the hosted zone to create records in, if different from the domain. | `string` | `null` | no |
| <a name="input_ssm_password_path"></a> [ssm\_password\_path](#input\_ssm\_password\_path) | The path in SSM where the SMTP password should be placed. Not used if left as null. | `string` | `null` | no |
| <a name="input_ssm_username_path"></a> [ssm\_username\_path](#input\_ssm\_username\_path) | The path in SSM where the SMTP username should be placed. Not used if left as null. | `string` | `null` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the IAM user to create. This will NOT be the resulting SMTP username, see output `smtp_username`. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_smtp_password"></a> [smtp\_password](#output\_smtp\_password) | The SMTP password of the user created. |
| <a name="output_smtp_username"></a> [smtp\_username](#output\_smtp\_username) | The SMTP username of the user created. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
