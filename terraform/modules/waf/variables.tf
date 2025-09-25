# 変数名: name
# 説明: WAFの名前
# 形式: string
# その他追記事項:

variable "name" {
  type = string
}

# 変数名: description
# 説明: WAFの説明
# 形式: string
# その他追記事項:

variable "description" {
  type = string
}

# 変数名: cloudwatch_log_group_arn
# 説明: CloudWatchのロググループのARN
# 形式: string
# その他追記事項:

variable "cloudwatch_log_group_arn" {
  type = string
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
