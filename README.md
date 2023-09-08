# cyhy-lambda-bucket-terraform #

[![GitHub Build Status](https://github.com/cisagov/cyhy-lambda-bucket-terraform/workflows/build/badge.svg)](https://github.com/cisagov/cyhy-lambda-bucket-terraform/actions)

This project creates an AWS S3 bucket to store the deployment artifacts for any
AWS Lambdas that will be used in a [CyHy](https://github.com/cisagov/cyhy_amis)
environment.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- AWS CLI access
  [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
  for the appropriate account on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [`backend.tf`](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [`backend.tf`](backend.tf)).

## Customizing Your Environment ##

Create a Terraform variables file to be used for your environment (e.g.
  `production.tfvars`), based on the variables listed in [Inputs](#inputs)
  below. Here is a sample of what that file might look like:

```hcl
aws_region = "us-east-2"

tags = {
  Team = "CISA Development Team"
  Application = "Cyber Hygiene Lambda Artifacts"
  Workspace = "production"
}
```

## Building the Terraform-based infrastructure ##

1. Create a Terraform workspace (if you haven't already done so) by running:

   ```console
   terraform workspace new <workspace_name>`
   ```

1. Create a `<workspace_name>.tfvars` file with all of the required
   variables and any optional variables desired (see [Inputs](#inputs) below
   for details).
1. Run the command `terraform init`.
1. Create the Terraform infrastructure by running the command:

   ```console
   terraform apply -var-file=<workspace_name>.tfvars
   ```

## Tearing down the Terraform-based infrastructure ##

1. Select the appropriate Terraform workspace by running
   `terraform workspace select <workspace_name>`.
1. Destroy the Terraform infrastructure in that workspace by running
   `terraform destroy -var-file=<workspace_name>.tfvars`.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 3.75 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.75 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_s3_bucket.lambda_artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.lambda_artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.lambda_artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.lambda_artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| lambda\_artifacts\_s3\_bucket | The name of the bucket where any Lambda deployment artifacts for a CyHy environment will be stored.  Note that in production Terraform workspaces, the string '-production' will be appended to the bucket name.  In non-production workspaces, '-<workspace\_name>' will be appended to the bucket name. | `string` | `"cyhy-lambda-deployment-artifacts"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |

## Outputs ##

No outputs.

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is only the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
