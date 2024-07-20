# Postgresql Instance
module "postgresql" {
  providers = {
    helm = helm
  }

  source = "./module/postgresql"
  count  = 1
  tags = {
    Name       = "Postgresql"
    Created_by = "terraform"
  }

  postgresql_storageclass_name = var.postgresql_storageclass_name
  postgresql_storage_size      = var.postgresql_storage_size
  postgresql_admin_password    = var.postgresql_admin_password
  postgresql_username          = var.postgresql_username
  postgresql_password          = var.postgresql_password

  values_file = "values/bitnami-postgresql-default-values"

  depends_on = [module.longhorn]
}
