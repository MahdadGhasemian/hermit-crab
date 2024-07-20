variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "longhorn"
}
variable "namespace" {
  description = "Namespace to install Longhorn chart into"
  type        = string
  default     = "longhorn-system"
}

variable "longhorn_chart_version" {
  description = "Version of Longhorn chart to install"
  type        = string
  default     = "1.6.2" # See https://artifacthub.io/packages/helm/longhorn/longhorn for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 800 # 10 minutes
}

variable "admin_password" {
  description = "Default Admin Password"
  type        = string
  default     = ""
}

variable "values_file" {
  description = "The name of the Longhorn helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
