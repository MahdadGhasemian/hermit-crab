variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "rancher"
}
variable "namespace" {
  description = "Namespace to install Rancher chart into"
  type        = string
  default     = "cattle-system"
}

variable "rancher_chart_version" {
  description = "Version of Rancher chart to install"
  type        = string
  default     = "2.8.5" # See https://artifacthub.io/packages/helm/rancher-stable/rancher for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 800 # 10 minutes
}

variable "rancher_host_name" {
  description = "Fully qualified name to reach your Rancher server"
  type        = string
  default     = ""
}

variable "values_file" {
  description = "The name of the Rancher helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
