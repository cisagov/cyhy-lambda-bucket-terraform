# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "lambda_artifacts_s3_bucket" {
  type        = string
  description = "The name of the bucket where any Lambda deployment artifacts for a CyHy environment will be stored.  Note that in production Terraform workspaces, the string '-production' will be appended to the bucket name.  In non-production workspaces, '-<workspace_name>' will be appended to the bucket name."
  default     = "cyhy-lambda-deployment-artifacts"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
