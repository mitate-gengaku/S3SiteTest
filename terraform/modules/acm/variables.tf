# 変数名: website_domain
# 説明: サイトのドメイン名
# 形式: string 例)example.com
# その他追記事項: サブドメインは伴わない

variable "website_domain" {
  type = string
}

# 変数名: validation_record_fqdns
# 説明:
# 形式: list(string)
# その他追記事項:

variable "validation_record_fqdns" {
  type = list(string)
}

# 変数名: default_tags
# 説明: 共通するタグキーのMap
# 形式: map(string)
# その他追記事項:

variable "default_tags" {
  type = map(string)
}


