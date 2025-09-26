############################################################################# 
# IAM
#############################################################################

# 変数名: github_org
# 説明: GitHubの組織名もしくはアカウント名
# 型の形式: string
# その他追記事項:
# ・必要なければsensitiveを外す

variable "github_org" {
  sensitive = true
  type      = string
}

# 変数名: github_repository
# 説明: 認可を要求するリポジトリ
# 型の形式: string
# その他追記事項:
# ・必要なければsensitiveを外す

variable "github_repository" {
  sensitive = true
  type      = string
}
