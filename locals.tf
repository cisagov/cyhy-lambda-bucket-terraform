locals {
  # Determine if this is a Production workspace by checking
  # if terraform.workspace begins with "prod"
  production_workspace = length(regexall("^prod", terraform.workspace)) == 1

  # Note that in production Terraform workspaces, the string '-production' is
  # appended to the bucket name.  In non-production workspaces,
  # '-<workspace_name>' is appended to the bucket name.
  bucket_name = format("%s-%s", var.lambda_artifacts_s3_bucket, local.production_workspace ? "production" : terraform.workspace)
}
