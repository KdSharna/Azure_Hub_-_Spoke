terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.55.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "pintu11"
    storage_account_name = "tattu101"
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
  subscription_id = "7e450572-1056-4117-9e7b-97e717138408"
}
