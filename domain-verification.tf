locals {
  # See https://docs.aws.amazon.com/general/latest/gr/ses.html#ses_dkim_domains for region-specific dkim domains
  dkim_domains_per_region = {
    "af-south-1"     = "dkim.af-south-1.amazonses.com"
    "ap-southeast-3" = "dkim.ap-southeast-3.amazonses.com"
    "ap-northeast-3" = "dkim.ap-northeast-3.amazonses.com"
    "eu-south-1"     = "dkim.eu-south-1.amazonses.com"
    "il-central-1"   = "dkim.il-central-1.amazonses.com"
    "us-gov-east-1"  = "dkim.us-gov-east-1.amazonses.com"
  }
  dkim_domain = lookup(local.dkim_domains_per_region, data.aws_region.current.name, "dkim.amazonses.com")
}

resource "aws_ses_domain_identity" "this" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain
}

resource "aws_ses_domain_identity_verification" "this" {
  domain = aws_ses_domain_identity.this.id
}

resource "aws_route53_record" "dkim" {
  count    = 3
  provider = aws.route53

  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${aws_ses_domain_dkim.this.dkim_tokens[count.index]}._domainkey.${var.domain}"
  type    = "CNAME"
  ttl     = "600"
  records = ["${aws_ses_domain_dkim.this.dkim_tokens[count.index]}.${local.dkim_domain}"]
}
