# 変数名: log_group_arn
# 説明: ロググループのARN
# 形式: string
# その他追記事項:

output "log_group_arn" {
  value = aws_cloudwatch_log_group.waf_log_group.arn
}
