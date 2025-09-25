resource "aws_cloudfront_distribution" "static_site_distribution" {
  enabled = var.enabled

  origin {
    origin_id                = var.s3_bucket_id
    domain_name              = var.s3_bucket_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.static_site_oac.id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.s3_bucket_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "https-only"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 3153600
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = var.allow_locations
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  aliases = [var.website_domain]

  web_acl_id = var.waf_id

  tags = merge(var.default_tags, {
    Name    = "static-site-distribution"
    Service = "CloudFront"
  })
}

resource "aws_cloudfront_origin_access_control" "static_site_oac" {
  name = "static_site_oac"

  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
