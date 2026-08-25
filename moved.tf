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

# State migration: EFS resources gained `count` so they can be skipped when
# using an external ClickHouse. These moved blocks prevent Terraform from
# destroying and recreating EFS when upgrading from versions that always
# created it.
moved {
  from = aws_efs_file_system.langfuse
  to   = aws_efs_file_system.langfuse[0]
}

moved {
  from = aws_security_group.efs
  to   = aws_security_group.efs[0]
}

moved {
  from = aws_iam_policy.efs
  to   = aws_iam_policy.efs[0]
}

moved {
  from = aws_iam_role.efs
  to   = aws_iam_role.efs[0]
}

moved {
  from = aws_iam_role_policy_attachment.efs
  to   = aws_iam_role_policy_attachment.efs[0]
}

moved {
  from = kubernetes_storage_class.efs
  to   = kubernetes_storage_class.efs[0]
}
