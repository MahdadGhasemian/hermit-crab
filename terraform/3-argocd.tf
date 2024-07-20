# ArgoCD
module "argocd" {
  providers = {
    helm = helm
  }

  source = "./module/argocd"
  count  = 1
  tags = {
    Name       = "Argocd"
    Created_by = "terraform"
  }

  insecure = true
  # admin_password = var.argocd_admin_password

  values_file = "values/argocd-default-values.yaml"
}
