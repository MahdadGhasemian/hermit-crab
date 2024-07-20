output "service_name" {
  value = kubernetes_service.redisinsight_service.metadata[0].name
}
