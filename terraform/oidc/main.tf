# モジュール名: iam
# 説明:
# ソース: ../modules/iam
# 依存関係:
# その他追記事項:

module "iam" {
  source = "../modules/iam"

  github_org        = var.github_org
  github_repository = var.github_repository
}

