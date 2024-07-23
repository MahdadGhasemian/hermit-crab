
# RedisInsight Instance
module "redisinsight" {
  source = "./module/redisinsight"
  count  = 1

  tags = {
    Name       = "RedisInsight"
    Created_by = "terraform"
  }
}
