resource "helm_release" "redis" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "redis"
  version          = var.redis_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = var.timeout_seconds

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]

  # Metrics
  # set {
  #   name  = "metrics.enabled"
  #   value = true
  # }

  # Master
  # set {
  #   name  = "master.nodeSelector.run"
  #   value = "packages"
  # }

  set {
    name  = "master.persistence.storageClass"
    value = var.redis_storageclass_name
  }

  set {
    name  = "master.persistence.size"
    value = var.redis_storage_size
  }

  set {
    name  = "master.resourcesPreset"
    value = "nano"
  }

  # Replica
  # set {
  #   name  = "replica.nodeSelector.run"
  #   value = "packages"
  # }

  set {
    name  = "replica.replicaCount"
    value = "1"
  }

  set {
    name  = "replica.persistence.storageClass"
    value = var.redis_storageclass_name
  }

  set {
    name  = "replica.persistence.size"
    value = var.redis_storage_size
  }

  set {
    name  = "replica.resourcesPreset"
    value = "nano"
  }
}
