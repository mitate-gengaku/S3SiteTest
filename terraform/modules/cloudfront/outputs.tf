# 変数名: cloudfront_arn
# 説明: CloudFrontディストリビューションのARN
# 形式: string
# その他追記事項: 

output "cloudfront_arn" {
  value       = aws_cloudfront_distribution.static_site_distribution.arn
  description = "CloudFrontディストリビューションのARN"
}

# 変数名: cloudfront_domain_name
# 説明: CloudFrontディストリビューションのデフォルトのドメイン名
# 形式: string
# その他追記事項: 

output "cloudfront_domain_name" {
  value       = aws_cloudfront_distribution.static_site_distribution.domain_name
  description = "CloudFrontディストリビューションのデフォルトのドメイン名"
}

# 変数名: cloudfront_zone_id
# 説明: CloudFrontディストリビューションのゾーンID
# 形式: string
# その他追記事項: 

output "cloudfront_zone_id" {
  value       = aws_cloudfront_distribution.static_site_distribution.hosted_zone_id
  description = "CloudFrontディストリビューションのゾーンID"
}
