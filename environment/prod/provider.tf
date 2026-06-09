terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "pintu11"
    storage_account_name = "tattu100"
    container_name       = "con99"
    key                  = "dev_orange.terraform_state"
  }
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "69ba3bc7-f967-4749-bbe8-54cb06e4a54a"
  #   tenant_id       = var.tenant_id
  #   client_id       = var.client_id
  #   client_secret   = var.client_secret
}
