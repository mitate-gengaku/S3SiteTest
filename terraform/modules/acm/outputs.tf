# 変数名: acm_validation_options
# 説明: ACM証明書のドメイン検証オプション
# 形式:
# その他追記事項: 

output "acm_validation_options" {
  description = "ACM証明書のドメイン検証オプション"
  value = {
    for ops in aws_acm_certificate.static_site_certificate.domain_validation_options : ops.domain_name => {
      name   = ops.resource_record_name
      type   = ops.resource_record_type
      record = ops.resource_record_value
    }
  }
}

# 変数名: acm_certificate_arn
# 説明: ACM証明書のARN
# 形式: string
# その他追記事項: 

output "acm_certificate_arn" {
  value = aws_acm_certificate.static_site_certificate.arn
}

