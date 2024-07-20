variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "redis"
}
variable "namespace" {
  description = "Namespace to install Redis chart into"
  type        = string
  default     = "redis"
}

variable "redis_chart_version" {
  description = "Version of Redis chart to install"
  type        = string
  default     = "19.5.2" # See https://artifacthub.io/packages/helm/bitnami/redis for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 1800 # 30 minutes
}

variable "values_file" {
  description = "The name of the Redis helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "redis_storageclass_name" {
  description = "PVC Storage Class"
  type        = string
  default     = ""
}

variable "redis_storage_size" {
  type        = string
  description = "PVC Storage Size"
  default     = "8Gi"
}

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
