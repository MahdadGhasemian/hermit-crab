# Longhorn
module "longhorn" {
  providers = {
    helm = helm
  }

  source = "./module/longhorn"
  count  = 1
  tags = {
    Name       = "Longhorn"
    Created_by = "terraform"
  }

  values_file = "values/longhorn-default-values.yaml"
}

# Secret for minio access
resource "kubernetes_manifest" "longhorn_minio_secret" {
  manifest = {
    apiVersion = "v1",
    kind       = "Secret",
    metadata = {
      name      = "longhorn-minio-secret"
      namespace = "longhorn-system"
    },
    type = "Opaque"
    data = {
      AWS_ACCESS_KEY_ID     = var.longhorn_minio_aws_access_key_id
      AWS_SECRET_ACCESS_KEY = var.longhorn_minio_aws_secret_access_key
      AWS_ENDPOINTS         = var.longhorn_minio_aws_endpoint
    }
  }

  depends_on = [module.longhorn]
}
