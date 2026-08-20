variable "bucket_name" {
  description = "Nombre único para el bucket S3"
  type        = string
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "El nombre del bucket debe tener entre 3 y 63 caracteres."
  }
}

variable "tags" {
  description = "Tags para el bucket"
  type        = map(string)
  default     = {}
}

variable "versioning_enabled" {
  description = "Habilitar versionado en el bucket"
  type        = bool
  default     = true
}

variable "encryption_algorithm" {
  description = "Algoritmo de encriptación: AES256 o aws:kms"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256", "aws:kms"], var.encryption_algorithm)
    error_message = "El algoritmo debe ser 'AES256' o 'aws:kms'."
  }
}

variable "kms_key_arn" {
  description = "ARN de la clave KMS para encriptación (solo si encryption_algorithm es 'aws:kms')"
  type        = string
  default     = ""
}

variable "bucket_policy" {
  description = "JSON de la política del bucket (opcional)"
  type        = string
  default     = ""
}

variable "logging_enabled" {
  description = "Habilitar logging de acceso al bucket"
  type        = bool
  default     = false
}

variable "logging_target_bucket" {
  description = "Bucket donde se almacenarán los logs"
  type        = string
  default     = ""
}

variable "logging_target_prefix" {
  description = "Prefijo para los logs dentro del bucket destino"
  type        = string
  default     = ""
}

