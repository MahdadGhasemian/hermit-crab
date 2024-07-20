# Redis Insight Deployment resource
resource "kubernetes_manifest" "redisinsight" {
  manifest = {
    apiVersion = "apps/v1"
    kind       = "Deployment"
    metadata = {
      name      = "redisinsight"
      namespace = var.namespace
      labels = merge(
        {
          app = "redisinsight"
        },
        var.tags
      )
    }
    spec = {
      replicas = var.replicas,
      selector = {
        matchLabels = {
          app = "redisinsight"
        }
      }
      template = {
        metadata = {
          labels = {
            app = "redisinsight"
          }
        }
        spec = {
          containers = [
            {
              name            = "redisinsight"
              image           = var.image
              imagePullPolicy = var.image_pull_policy
              volumeMounts = [
                {
                  name      = "db"
                  mountPath = "/db"
                }
              ]
              ports = [
                {
                  containerPort = var.container_port
                  protocol      = "TCP"
                }
              ]
            }
          ]
          volumes = [
            {
              name = "db",
              emptyDir : {}
            }
          ]
        }
      }
    }
  }
}

# Redis Insight Service resource
resource "kubernetes_service" "redisinsight_service" {
  metadata {
    name      = "redisinsight-service"
    namespace = var.namespace
  }
  spec {
    type = "ClusterIP"
    port {
      port        = var.service_port
      target_port = var.container_port
    }
    selector = {
      app = "redisinsight"
    }
  }

  depends_on = [kubernetes_manifest.redisinsight]
}
