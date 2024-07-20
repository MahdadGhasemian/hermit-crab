
# Lables
variable "node_labels" {
  description = "A map of nodes and their respective labels"
  type        = map(map(string))
}

# Traefik Host name
variable "traefik_hostname" {
  description = "Hostname for Traefik IngressRoute"
  default     = "traefik.example.com"
}

# Traefik Login Secret
variable "traefik_users_secret" {
  description = "Traefik Login Secret"
}

# Argocd Host name
variable "argocd_hostname" {
  description = "Hostname for ArgoCD IngressRoute"
  default     = "argocd.example.com"
}

# Longhorn Host name
variable "longhorn_hostname" {
  description = "Hostname for Longhorn IngressRoute"
  default     = "longhorn.example.com"
}

# Longhorn Login Secret
variable "longhorn_users_secret" {
  description = "Longhorn Login Secret"
}

# Postgresql Host name
variable "postgresql_hostname" {
  description = "Hostname for Postgresql IngressRoute"
  default     = "postgresql.example.com"
}

# Redis Insight Host name
variable "redisinsight_hostname" {
  description = "Hostname for Redis Insight IngressRoute"
  default     = "redisinsight.example.com"
}

# Redis Insight Login Secret
variable "redisinsight_users_secret" {
  description = "Redis Insight Login Secret"
}

# Redis
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

# RabbitMQ
variable "rabbitmq_storageclass_name" {
  description = "RabbitMQ PVC Storage Classd"
  type        = string
  default     = ""
}

variable "rabbitmq_storage_size" {
  type        = string
  description = "PVC Storage Size"
  default     = "8Gi"
}

variable "rabbitmq_admin_password" {
  description = "User Password"
  type        = string
  default     = ""
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

variable "gitlab_certmanager_issuer_email" {
  description = "The email address to register certificates requested from Let's Encrypt."
  type        = string
}
