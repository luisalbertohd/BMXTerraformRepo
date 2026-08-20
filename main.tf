terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del proveedor AWS
provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

# Llamada al módulo S3
module "s3_bucket" {
  source = "./modules/s3 bucket"

  # Valores que vienen de variables definidas en el tfvars
  bucket_name          = var.bucket_name
  tags                 = var.tags
  versioning_enabled   = var.versioning_enabled
  encryption_algorithm = var.encryption_algorithm
  kms_key_arn          = var.kms_key_arn
  bucket_policy        = var.bucket_policy
  logging_enabled      = var.logging_enabled
  logging_target_bucket = var.logging_target_bucket
  logging_target_prefix = var.logging_target_prefix
  
}

# Outputs de la configuración raíz
output "s3_bucket_info" {
  description = "Información del bucket creado"
  value = {
    name       = module.s3_bucket.bucket_id
    arn        = module.s3_bucket.bucket_arn
    region     = module.s3_bucket.bucket_region
    domain     = module.s3_bucket.bucket_domain_name
  }
}