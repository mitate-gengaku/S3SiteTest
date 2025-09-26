resource "aws_s3_bucket" "static_static_bucket" {
  bucket = var.s3_bucket_name

  force_destroy = true

  tags = merge(var.default_tags, {
    Service = "S3"
  })
}

resource "aws_s3_bucket_ownership_controls" "static_site_boc" {
  bucket = aws_s3_bucket.static_static_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_policy" "static_site_bucket_policy" {
  bucket = aws_s3_bucket.static_static_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_cloudfront.json
}

