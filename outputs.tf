output "access_point" {
  description = "The multi-region access point used to provide cross-region access to the Lambda deployment artifacts bucket."
  value       = aws_s3control_multi_region_access_point.lambda_artifacts
}

output "bucket" {
  description = "The S3 bucket used to store the deployment artifacts for Lambda functions in a CyHy environment."
  value       = aws_s3_bucket.lambda_artifacts.bucket
}
