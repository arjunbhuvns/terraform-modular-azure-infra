terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"

    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6123f378-6ceb-4ba0-83c4-0ed63b739551"
}
