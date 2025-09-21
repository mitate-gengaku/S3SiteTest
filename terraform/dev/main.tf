#============================================================================
# IAM
#============================================================================

# OIDCプロバイダー

resource "aws_iam_openid_connect_provider" "oidc" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
}

# OIDC用ロール
resource "aws_iam_role" "oidc_role" {
  name = "AWSOIDCRoleForGithub"
  path = "/"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = aws_iam_openid_connect_provider.oidc.arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
        }
        StringLike = {
          "token.actions.githubusercontent.com:sub" : "repo:${var.github_org}/${var.github_repository}:ref:refs/heads/${var.github_branch}"
        }
      }
    }]
  })
}

# ポリシーをアタッチ
resource "aws_iam_role_policy_attachment" "tmp" {
  role       = aws_iam_role.oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
