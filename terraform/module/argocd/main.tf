resource "helm_release" "argocd" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = var.timeout_seconds

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]


  # set_sensitive {
  #   name  = "configs.secret.argocdServerAdminPassword"
  #   value = var.admin_password == "" ? "" : bcrypt(var.admin_password)
  # }

  set {
    name  = "configs.params.server\\.insecure"
    value = var.insecure == false ? false : true
  }

  set {
    name  = "dex.enabled"
    value = var.enable_dex == true ? true : false
  }

  # set {
  #   name  = "global.nodeSelector.run"
  #   value = "packages"
  # }

  # Notification ==============================================
  # set {
  #   name  = "notifications.enabled"
  #   value = true
  # }

  # set {
  #   name  = "notifications.secret.create"
  #   value = false
  # }

  # set {
  #   name  = "notifications.cm.create"
  #   value = false
  # }
  # ===========================================================

  # Resource limits and requests for the application controller pods
  set {
    name  = "controller.resources.limits.cpu"
    value = "700m"
  }
  set {
    name  = "controller.resources.limits.memory"
    value = "1024Mi"
  }
  set {
    name  = "controller.resources.requests.cpu"
    value = "500m"
  }
  set {
    name  = "controller.resources.requests.memory"
    value = "512Mi"
  }

  # Resource limits and requests for dex
  set {
    name  = "dex.resources.limits.cpu"
    value = "200m"
  }
  set {
    name  = "dex.resources.limits.memory"
    value = "512Mi"
  }
  set {
    name  = "dex.resources.requests.cpu"
    value = "100m"
  }
  set {
    name  = "dex.resources.requests.memory"
    value = "128Mi"
  }

  # Resource limits and requests for redis
  set {
    name  = "redis.resources.limits.cpu"
    value = "300m"
  }
  set {
    name  = "redis.resources.limits.memory"
    value = "512Mi"
  }
  set {
    name  = "redis.resources.requests.cpu"
    value = "200m"
  }
  set {
    name  = "redis.resources.requests.memory"
    value = "512Mi"
  }

  # Resource limits and requests for the Argo CD server
  set {
    name  = "server.resources.limits.cpu"
    value = "200m"
  }
  set {
    name  = "server.resources.limits.memory"
    value = "512Mi"
  }
  set {
    name  = "server.resources.requests.cpu"
    value = "100m"
  }
  set {
    name  = "server.resources.requests.memory"
    value = "256Mi"
  }

  # Resource limits and requests for the repo server pods
  set {
    name  = "repoServer.resources.limits.cpu"
    value = "200m"
  }
  set {
    name  = "repoServer.resources.limits.memory"
    value = "512Mi"
  }
  set {
    name  = "repoServer.resources.requests.cpu"
    value = "100m"
  }
  set {
    name  = "repoServer.resources.requests.memory"
    value = "256Mi"
  }

  # Resource limits and requests for the ApplicationSet controller pods.
  set {
    name  = "applicationSet.resources.limits.cpu"
    value = "200m"
  }
  set {
    name  = "applicationSet.resources.limits.memory"
    value = "512Mi"
  }
  set {
    name  = "applicationSet.resources.requests.cpu"
    value = "200m"
  }
  set {
    name  = "applicationSet.resources.requests.memory"
    value = "256Mi"
  }

  #Resource limits and requests for the notifications controller
  set {
    name  = "notifications.resources.limits.cpu"
    value = "200m"
  }
  set {
    name  = "notifications.resources.limits.memory"
    value = "512Mi"
  }
  set {
    name  = "notifications.resources.requests.cpu"
    value = "100m"
  }
  set {
    name  = "notifications.resources.requests.memory"
    value = "256Mi"
  }
}
