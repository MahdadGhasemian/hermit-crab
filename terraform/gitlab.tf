# Gitlab
module "gitlab" {
  providers = {
    helm = helm
  }

  source = "./module/gitlab"
  count  = 0
  tags = {
    Name       = "Gitlab"
    Created_by = "terraform"
  }

  gitlab_certmanager_issuer_email = var.gitlab_certmanager_issuer_email

  values_file = "values/gitlab-default-values.yaml"
}
