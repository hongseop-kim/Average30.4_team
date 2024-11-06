# Redis.tf (provider 블록 제거)
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "my-redis-cluster"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name

  tags = {
    Name        = "My Redis Cluster"
    Environment = "Production"
    Project     = "VIR"
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "my-redis-subnet-group"
  subnet_ids = [aws_subnet.pub_sub_a.id, aws_subnet.pub_sub_c.id]

  tags = {
    Name        = "My Redis Subnet Group"
    Environment = "Production"
    Project     = "VIR"
  }
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.redis.configuration_endpoint
}

