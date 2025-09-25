resource "aws_acm_certificate" "static_site_certificate" {
  domain_name       = var.website_domain
  validation_method = "DNS"
  key_algorithm     = "RSA_2048"

  subject_alternative_names = ["www.${var.website_domain}", "*.${var.website_domain}"]

  lifecycle {
    create_before_destroy = true
  }

  provider = aws.virginia

  tags = merge(var.default_tags, {
    Name    = var.website_domain
    Service = "Certificate Manager"
  })
}

resource "aws_acm_certificate_validation" "static_site_certificate_validation" {
  certificate_arn         = aws_acm_certificate.static_site_certificate.arn
  validation_record_fqdns = var.validation_record_fqdns
  provider                = aws.virginia
}

