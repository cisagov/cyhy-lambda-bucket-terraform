# Create a multi-region access point for the Lambda deployment artifacts bucket
# to provide cross-region access to a workspace's Lambda deployment artifacts.
resource "aws_s3control_multi_region_access_point" "lambda_artifacts" {
  details {
    name = local.bucket_name

    # This mirrors the configuration for the S3 bucket that stores the Lambda
    # deployment artifacts.
    public_access_block {
      block_public_acls       = true
      block_public_policy     = true
      ignore_public_acls      = true
      restrict_public_buckets = true
    }

    region {
      bucket = aws_s3_bucket.lambda_artifacts.id
    }
  }
}
