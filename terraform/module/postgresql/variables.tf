variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "postgresql"
}
variable "namespace" {
  description = "Namespace to install Postgresql chart into"
  type        = string
  default     = "postgresql"
}

variable "postgresql_chart_version" {
  description = "Version of Postgresql chart to install"
  type        = string
  default     = "15.5.17" # See https://artifacthub.io/packages/helm/bitnami/postgresql for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 600 # 10 minutes
}

variable "values_file" {
  description = "The name of the Postgresql helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "postgresql_storageclass_name" {
  description = "PVC Storage Class"
  type        = string
  default     = ""
}

variable "postgresql_storage_size" {
  type        = string
  description = "PVC Storage Size"
  default     = "8Gi"
}

variable "postgresql_admin_password" {
  description = "Admin Password"
  type        = string
}

variable "postgresql_username" {
  description = "User Password"
  type        = string
}

variable "postgresql_password" {
  description = "User Password"
  type        = string
}

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
