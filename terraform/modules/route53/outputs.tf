# 変数名: validation_record_cqdns
# 説明: ACM証明書のドメイン検証用にRoute53に作成されたDNSレコードの完全修飾ドメイン名（FQDN）のリスト
# 形式:
# その他追記事項: 

output "acm_validation_options" {
  description = "ACM証明書のドメイン検証用にRoute53に作成されたDNSレコードの完全修飾ドメイン名（FQDN）のリスト"

  value = flatten([values(aws_route53_record.static_site_domain_record)[*].fqdn])
}

