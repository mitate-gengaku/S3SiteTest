# 変数名: zone_id
# 説明: 静的サイトのドメインのzone id
# 型の形式: 
# その他追記事項: 

variable "zone_id" {
  type = string
}

# 変数名: website_domain
# 説明: サイトのドメイン名
# 形式: string 例)example.com
# その他追記事項: サブドメインは伴わない

variable "website_domain" {
  type = string
}

# 変数名: cloudfront_domain
# 説明: CloudFrontのデフォルトのドメイン名
# 形式: string
# その他追記事項:

variable "cloudfront_domain" {
  type = string
}

# 変数名: cloudfront_zone_id
# 説明: CloudFrontのzone id
# 形式: string
# その他追記事項:

variable "cloudfront_zone_id" {
  type = string
}

# 変数名: acm_validation_options
# 説明: ACM証明書のドメイン検証オプション
# 形式: ???
# その他追記事項:

variable "acm_validation_options" {
}

