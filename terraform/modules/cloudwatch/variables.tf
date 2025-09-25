# 変数名: log_group_name
# 説明: ロググループの名前
# 型の形式: string
# その他追記事項: 

variable "log_group_name" {
  type = string
}

# 変数名: default_tags
# 説明: 共通するタグキーのMap
# 形式: map(string)
# その他追記事項:

variable "default_tags" {
  type = map(string)
}
