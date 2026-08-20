# Variables de AWS
variable "aws_region" {
  description = "Región de AWS donde crear los recursos"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Perfil de AWS CLI a utilizar"
  type        = string
  default     = "default"
}

# Variables del bucket
variable "bucket_name" {
  description = "Nombre único para el bucket S3"
  type        = string
}

variable "tags" {
  description = "Tags para el bucket"
  type        = map(string)
  default     = {}
}

variable "versioning_enabled" {
  description = "Habilitar versionado"
  type        = bool
  default     = true
}

variable "encryption_algorithm" {
  description = "Algoritmo de encriptación"
  type        = string
  default     = "AES256"
}

variable "kms_key_arn" {
  description = "ARN de la clave KMS"
  type        = string
  default     = ""
}

variable "bucket_policy" {
  description = "Política del bucket en JSON"
  type        = string
  default     = ""
}

variable "logging_enabled" {
  description = "Habilitar logging"
  type        = bool
  default     = false
}

variable "logging_target_bucket" {
  description = "Bucket destino para logs"
  type        = string
  default     = ""
}

variable "logging_target_prefix" {
  description = "Prefijo para logs"
  type        = string
  default     = ""
}
