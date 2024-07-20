variable "namespace" {
  description = "The namespace to deploy Redis Insight"
  type        = string
  default     = "redis"
}

variable "replicas" {
  description = "Number of replicas for the Redis Insight deployment"
  type        = number
  default     = 1
}

variable "image" {
  description = "The Redis Insight Docker image"
  type        = string
  default     = "redislabs/redisinsight:1.7.0"
}

variable "image_pull_policy" {
  description = "Image pull policy for Redis Insight containers"
  type        = string
  default     = "IfNotPresent"
}

variable "container_port" {
  description = "Container port for Redis Insight"
  type        = number
  default     = 8001
}

variable "service_port" {
  description = "Service port for Redis Insight"
  type        = number
  default     = 80
}

variable "tags" {
  description = "Labels to be applied to resources"
  type        = map(string)
}
