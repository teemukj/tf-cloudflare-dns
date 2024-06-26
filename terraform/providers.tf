# Provider configurations
terraform {
  required_version = "~>1.8"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }
  }
  backend "azurerm" {
    resource_group_name  = "<azure-rg-name>"
    storage_account_name = "<azure-storage-account-name>"
    container_name       = "<azure-storage-container-name>"
    key                  = "cloudflare.tfstate"
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}