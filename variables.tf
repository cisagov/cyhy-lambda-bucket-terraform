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
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  type        = string
}

variable "lambda_artifacts_s3_bucket" {
  default     = "cyhy-lambda-deployment-artifacts"
  description = "The name of the bucket where any Lambda deployment artifacts for a CyHy environment will be stored.  Note that in production Terraform workspaces, the string '-production' will be appended to the bucket name.  In non-production workspaces, '-<workspace_name>' will be appended to the bucket name."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  type        = map(string)
}
