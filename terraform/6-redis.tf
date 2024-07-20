
# Redis Instance
module "redis" {
  providers = {
    helm = helm
  }

  source = "./module/redis"
  count  = 1
  tags = {
    Name       = "Redis"
    Created_by = "terraform"
  }

  redis_storageclass_name = var.redis_storageclass_name
  redis_storage_size      = var.redis_storage_size

  values_file = "values/bitnami-redis-default-values"

  depends_on = [module.longhorn]
}
