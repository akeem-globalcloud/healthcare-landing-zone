#This bucket stores Project Union Files
resource "aws_s3_bucket" "project_union_s3" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "project_union_s3" {
  bucket = aws_s3_bucket.project_union_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt_bucket" {
  bucket = aws_s3_bucket.project_union_s3.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_id
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "project_union_s3" {
  bucket = aws_s3_bucket.project_union_s3.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

