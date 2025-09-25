

data "aws_route53_zone" "static_site_zone" {
  name         = "${var.website_domain}."
  private_zone = false
}

