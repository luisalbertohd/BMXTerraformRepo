output "bucket_id" {
  description = "Nombre del bucket"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN del bucket"
  value       = aws_s3_bucket.this.arn
}

output "bucket_region" {
  description = "Región del bucket"
  value       = aws_s3_bucket.this.region
}

output "bucket_domain_name" {
  description = "Nombre de dominio del bucket"
  value       = aws_s3_bucket.this.bucket_domain_name
}

