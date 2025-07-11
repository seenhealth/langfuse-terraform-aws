output "cluster_name" {
  description = "EKS Cluster Name to use for a Kubernetes terraform provider"
  value       = aws_eks_cluster.langfuse.name
}

output "cluster_host" {
  description = "EKS Cluster host to use for a Kubernetes terraform provider"
  value       = aws_eks_cluster.langfuse.endpoint
}

output "cluster_ca_certificate" {
  description = "EKS Cluster CA certificate to use for a Kubernetes terraform provider"
  value       = base64decode(aws_eks_cluster.langfuse.certificate_authority[0].data)
  sensitive   = true
}

output "cluster_token" {
  description = "EKS Cluster Token to use for a Kubernetes terraform provider"
  value       = data.aws_eks_cluster_auth.langfuse.token
  sensitive   = true
}

output "route53_nameservers" {
  description = "Nameserver for the Route53 zone (only when zone is created)"
  value       = var.existing_certificate_arn == null ? aws_route53_zone.zone[0].name_servers : null
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "Private subnet IDs from the VPC module"
  value       = module.vpc.private_subnets
}

output "public_subnet_ids" {
  description = "Public subnet IDs from the VPC module"
  value       = module.vpc.public_subnets
}

output "private_route_table_ids" {
  description = "Private route table IDs from the VPC module"
  value       = module.vpc.private_route_table_ids
}

output "bucket_name" {
  description = "Name of the S3 bucket for Langfuse"
  value       = local.bucket_name
}

output "bucket_id" {
  description = "ID of the S3 bucket for Langfuse"
  value       = local.bucket_id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket for Langfuse"
  value       = local.bucket_arn
}

output "certificate_arn" {
  description = "ARN of the ACM certificate being used"
  value       = local.certificate_arn
}

output "load_balancer_dns_name" {
  description = "DNS name of the ALB created by the ingress controller"
  value       = data.aws_lb.ingress.dns_name
}

output "load_balancer_zone_id" {
  description = "Zone ID of the ALB created by the ingress controller"
  value       = data.aws_lb.ingress.zone_id
}
