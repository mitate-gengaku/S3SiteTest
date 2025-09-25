resource "aws_cloudwatch_log_group" "waf_log_group" {
  name   = var.log_group_name
  region = "us-east-1"
  tags = merge(var.default_tags, {
    Name    = var.log_group_name,
    Service = "Cloud Watch"
  })
}

resource "aws_cloudwatch_log_resource_policy" "waf_log_policy" {
  policy_document = data.aws_iam_policy_document.waf_log_policy.json
  policy_name     = "${var.log_group_name}-policy"
}
