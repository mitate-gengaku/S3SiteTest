# 変数名: waf_id
# 説明: WAFのID
# 形式: string
# その他追記事項: 

output "waf_id" {
  value       = aws_wafv2_web_acl.cloudfront.arn
  description = "WAFのID"
}

