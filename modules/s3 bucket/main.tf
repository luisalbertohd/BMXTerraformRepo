# Recurso principal del bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags

  lifecycle {
    ignore_changes = [
      tags_all,
      # Si quieres ignorar cambios en el nombre en ciertos casos
      # bucket,
    ]
  }
}

# Bloquear acceso público (SIEMPRE recomendado)
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Versionado
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

# Encriptación
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.encryption_algorithm
      kms_master_key_id = var.kms_key_arn != "" ? var.kms_key_arn : null
    }
  }
}



