
# tf-cloudflare-dns

Example repository for managing Cloudflare domain DNS zone records with Terraform. Repository contains ready-to-use Terraform module with examples, as well as a GitHub workflow template for deploying the configuration.

Resources are configured using `cloudflare/cloudflare` Terraform provider. Additional provider information available in the [official documentation](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs).

Cloudflare also offers [a tool](https://github.com/cloudflare/cf-terraforming) for generating templates and importing existing resources to Terraform state.

## Prerequisites

- Some general knowledge about Terraform
- Cloudflare API token with permission (`Zone.DNS`) to manage the DNS zones. Instructions in [Cloudflare docs](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/).
- Terraform remote backend configuration to store the state file
  - In this repository, `azurerm` provider & Azure Storage Account is used for the remote state
  - Azure remote backend connection is set up with OIDC following the [GitHub instructions](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-azure)
- Migration decision:
  - Option 1: Do not migrate existing, use Terraform only for new zones/records
  - Option 2: Import existing records to Terraform state
  - Option 3 (**Recommended approach for easy migration**):
    - Create "duplicate/copy" records with Terraform for every zone and validate the results. Repository contains Terraform local `record_name_prefix` in `terraform/main.tf` which can be used to easily inject a prefix (e.g `test-`) to every record created with Terraform
    - After confirming the records are created correctly, delete all records from the zone (e.g. from the CF dashboard), set the Terraform local value `record_name_prefix` back to empty string ("") and deploy again --> no state file importing needed

## How to use

General high-level instructions for usage. Basic knowledge of Terraform & GitHub & Cloudflare is assumpted.
Examples of syntax/usage are available in the repository.

1) Set GitHub repository secrets:
    - Cloudflare API token as `CLOUDFLARE_API_TOKEN`
    - If using Azure remote backend, also set `AZURE_CLIENT_ID`, `AZURE_TENANT_ID` and `AZURE_SUBSCRIPTION_ID` secrets
2) In `terraform/main.tf`, set your domain names / dns zones to the Terraform local `cloudflare_zones` map
    - Based on this local, Terraform will fetch data from the zones
3) For each zone, create a zone variable in `terraform/variables.tf`
4) For each zone, create zone variable value file in `terraform/records/domain_tld.tfvars`
    - Insert all zone records objects to create
5) For each zone, create modlue call in `terraform/main.tf`
    - Set the `for_each` loop variable to the zone specific variable created in step 4.
    - Set the `zone_id` value to the zone specific Terraform data reference
6) Deploy using the included GitHub workflow
    - Workflow is set to automatically trigger from `dev`and `main` branches. `dev` branch trigger will only run the Terraform plan job and hence can be used to inspect the changes. `main` branch will trigger will run plan and apply jobs.
