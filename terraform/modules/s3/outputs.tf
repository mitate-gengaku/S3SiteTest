# 変数名: s3_bucket_id
# 説明: S3バケットのID
# 形式: string
# その他追記事項: 

output "s3_bucket_id" {
  value       = aws_s3_bucket.static_static_bucket.id
  description = "S3のバケットID"
}

# 変数名: s3_bucket_domain_name
# 説明: S3バケットのドメイン名
# 形式: string
# その他追記事項: 

output "s3_bucket_domain_name" {
  value       = aws_s3_bucket.static_static_bucket.bucket_regional_domain_name
  description = "S3のバケットのドメイン名"
}
