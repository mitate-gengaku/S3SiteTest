# 変数名: website_domain
# 説明: サイトのドメイン名
# 形式: string 例)example.com
# その他追記事項: サブドメインは伴わない

variable "website_domain" {
  type = string
}

# 変数名: s3_bucket_id
# 説明: S3バケットのID
# 形式: string
# その他追記事項: 

variable "s3_bucket_id" {
  type = string
}

# 変数名: s3_bucket_domain_name
# 説明: S3バケットのドメイン名
# 形式: string
# その他追記事項: 

variable "s3_bucket_domain_name" {
  type = string
}

# 変数名: enabled
# 説明: CloudFrontを起動するか
# 形式: boolean
# その他追記事項: 

variable "enabled" {
  type    = bool
  default = false
}


# 変数名: allow_locations
# 説明: サイトにアクセスできる国のリスト
# 形式: list(string) 例) ["JP"]
# その他追記事項: 
# ・カンマで区切る

variable "allow_locations" {
  type    = list(string)
  default = ["JP"]
}

# 変数名: default_tags
# 説明: 共通するタグキーのMap
# 形式: map(string)
# その他追記事項:

variable "default_tags" {
  type = map(string)
}

# 変数名: acm_certificate_arn
# 説明: 証明書のARN
# 形式: string
# その他追記事項:

variable "acm_certificate_arn" {
  type      = string
  sensitive = true
}

# 変数名: waf_id
# 説明: WAFのID
# 形式: string
# その他追記事項:

variable "waf_id" {
  type = string
}

