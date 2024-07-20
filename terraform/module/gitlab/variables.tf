variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "gitlab"
}
variable "namespace" {
  description = "Namespace to install Gitlab chart into"
  type        = string
  default     = "gitlab"
}

variable "gitlab_chart_version" {
  description = "Version of Gitlab chart to install"
  type        = string
  default     = "8.1.2" # See https://artifacthub.io/packages/helm/gitlab/gitlab for latest version(s)
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
  description = "The name of the Gitlab helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "gitlab_certmanager_issuer_email" {
  description = "The email address to register certificates requested from Let's Encrypt."
  type        = string
}

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
