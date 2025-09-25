# 変数名: s3_bucket_name
# 説明: HTMLファイルを格納するバケット名
# 形式: string
# その他追記事項: 
# ・3 ~ 63文字
# ・小文字・大文字・数字・ピリオド・ハイフン

variable "s3_bucket_name" {
  type = string
}

# 変数名: default_tags
# 説明: 共通するタグキーのMap
# 形式: map(string)
# その他追記事項:

variable "default_tags" {
  type    = map(string)
  default = {}
}

# 変数名: cloudfront_arn
# 説明: CloudfrontディストリビューションのARN
# 形式: string
# その他追記事項:

variable "cloudfront_arn" {
  type = string
}

