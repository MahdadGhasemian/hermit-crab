resource "helm_release" "postgresql" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "postgresql"
  version          = var.postgresql_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = var.timeout_seconds

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]

  set {
    name  = "primary.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "primary.persistence.storageClass"
    value = var.postgresql_storageclass_name
  }

  set {
    name  = "primary.persistence.size"
    value = var.postgresql_storage_size
  }

  set {
    name  = "global.postgresql.auth.postgresPassword"
    value = var.postgresql_admin_password
  }

  set {
    name  = "global.postgresql.auth.username"
    value = var.postgresql_username
  }

  set {
    name  = "global.postgresql.auth.password"
    value = var.postgresql_password
  }

}
