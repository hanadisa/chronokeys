terraform {
  backend "azurerm" {
    resource_group_name  = "chronokeys-tfstate-rg"
    storage_account_name = "chronokeystfstate"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
