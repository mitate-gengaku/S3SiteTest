resource "aws_wafv2_web_acl" "cloudfront" {
  name        = var.name
  description = var.description
  scope       = "CLOUDFRONT"
  region      = "us-east-1"

  default_action {
    block {}
  }

  rule {
    name     = "DisableOverseasIP"
    priority = 1

    action {
      allow {}
    }

    statement {
      geo_match_statement {
        country_codes = var.allow_locations
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "DisableOverseasIPMetric"
      sampled_requests_enabled   = false
    }
  }

  rule {
    name     = "AWSRateBasedRule"
    priority = 10

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = 300
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSRateBasedRuleWAFMetric"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "CloudFrontWAFMetric"
    sampled_requests_enabled   = true
  }

  tags = merge(var.default_tags, {
    Name    = var.name
    Service = "WAF"
  })
}

resource "aws_wafv2_web_acl_logging_configuration" "waf_logging_config" {
  log_destination_configs = [var.cloudwatch_log_group_arn]
  resource_arn            = aws_wafv2_web_acl.cloudfront.arn
  region                  = "us-east-1"
}
