resource "aws_route53_record" "static_site_domain_record" {
  zone_id = var.zone_id

  for_each = var.acm_validation_options

  allow_overwrite = true
  name            = each.value.name
  type            = each.value.type
  ttl             = 600
  records         = [each.value.record]
}

resource "aws_route53_record" "static_site_cloudfront_record" {
  zone_id = var.zone_id

  name = var.website_domain
  type = "A"

  alias {
    name                   = var.cloudfront_domain
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = true
  }
}

