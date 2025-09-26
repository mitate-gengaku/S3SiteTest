# モジュール名: s3
# 説明:
# ソース: ../modules/s3
# 依存関係:
# その他追記事項:

module "s3" {
  source = "../modules/s3"

  s3_bucket_name = var.s3_bucket_name
  cloudfront_arn = module.cloudfront.cloudfront_arn
  default_tags   = var.default_tags
}

# モジュール名: cloudfront
# 説明:
# ソース: ../modules/cloudfront
# 依存関係:
# その他追記事項:

module "cloudfront" {
  source = "../modules/cloudfront"

  enabled        = false
  website_domain = var.website_domain

  s3_bucket_id          = module.s3.s3_bucket_id
  s3_bucket_domain_name = module.s3.s3_bucket_domain_name

  acm_certificate_arn = module.acm.acm_certificate_arn

  waf_id       = module.waf.waf_id
  default_tags = var.default_tags
}

# モジュール名: route53
# 説明:
# ソース: ../modules/route53
# 依存関係:
# その他追記事項:

module "route53" {
  source = "../modules/route53"

  zone_id        = data.aws_route53_zone.static_site_zone.zone_id
  website_domain = var.website_domain

  cloudfront_domain      = module.cloudfront.cloudfront_domain_name
  cloudfront_zone_id     = module.cloudfront.cloudfront_zone_id
  acm_validation_options = module.acm.acm_validation_options
}

# モジュール名: acm
# 説明:
# ソース: ../modules/acm
# 依存関係:
# その他追記事項:

module "acm" {
  source = "../modules/acm"

  website_domain          = var.website_domain
  validation_record_fqdns = module.route53.acm_validation_options

  default_tags = var.default_tags

  providers = {
    aws.virginia = aws.virginia
  }
}

# モジュール名: waf
# 説明:
# ソース: ../modules/waf
# 依存関係:
# その他追記事項:

module "waf" {
  source = "../modules/waf"

  depends_on = [module.cloudwatch]

  name                     = "static-site-waf"
  description              = "WAF rules for static site with cloudfront"
  cloudwatch_log_group_arn = module.cloudwatch.log_group_arn

  allow_locations = var.allow_locations
  default_tags    = var.default_tags
}

# モジュール名: cloudwatch
# 説明:
# ソース: ../modules/cloudwatch
# 依存関係:
# その他追記事項:

module "cloudwatch" {
  source = "../modules/cloudwatch"

  log_group_name = "aws-waf-logs-static-site"
  default_tags   = var.default_tags
}
