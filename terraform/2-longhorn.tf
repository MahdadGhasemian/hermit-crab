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
