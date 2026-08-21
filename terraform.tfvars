# Entorno: Desarrollo
aws_region  = "us-east-1"
aws_profile = "dev"

bucket_name = "mi-app-dev-2026-08-21"
tags = {
  Environment = "Development"
  Project     = "MiApp"
  ManagedBy   = "Terraform"
  Team        = "DevOps"
}

versioning_enabled   = true
encryption_algorithm = "AES256"

# Logging habilitado
logging_enabled        = true
logging_target_bucket  = "mi-app-logs-dev"
logging_target_prefix  = "s3-access-logs/"
