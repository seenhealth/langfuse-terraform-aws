# State migration: VPC module and S3 endpoint gained `count` parameters
# to support bring-your-own-VPC. These moved blocks prevent Terraform
# from destroying and recreating resources when upgrading from
# pre-BYOVPC versions.
moved {
  from = module.vpc
  to   = module.vpc[0]
}

moved {
  from = aws_vpc_endpoint.s3
  to   = aws_vpc_endpoint.s3[0]
}
