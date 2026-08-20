# Entorno: Desarrollo
aws_region  = "us-east-1"
aws_profile = "dev"

bucket_name = "mi-app-dev-2026-08-12"
tags = {
  Environment = "Development"
  Project     = "MiApp"
  ManagedBy   = "Terraform"
  Team        = "DevOps"
}

versioning_enabled   = true
encryption_algorithm = "AES256"


