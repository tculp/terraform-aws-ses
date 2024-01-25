terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.14"

      configuration_aliases = [aws.route53]
    }
  }

  required_version = ">=1.2.0"
}
