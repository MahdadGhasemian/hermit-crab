# Rancher Instance
module "rancher" {
  providers = {
    helm = helm
  }

  source = "./module/rancher"
  count  = 0
  tags = {
    Name       = "Rancher"
    Created_by = "terraform"
  }

  rancher_host_name = var.rancher_host_name

  values_file = "values/rancher-default-values"
}
