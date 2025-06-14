resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket
}

resource "aws_s3_bucket_public_access_block" "access-block" {
  bucket = aws_s3_bucket.s3-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.s3-bucket.id

  index_document {
    suffix = "index.html"
  }
}
data "aws_iam_policy_document" "public_read" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]
 
    resources = [
      "${aws_s3_bucket.s3-bucket.arn}/*"
    ]
  }
}
 
resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.s3-bucket.id
  policy = data.aws_iam_policy_document.public_read.json
}
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.s3-bucket.id
  key    = "index.html"
   content_type = "text/html"
  source = "index.html"
}




 
