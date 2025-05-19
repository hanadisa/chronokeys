#ACR Data
data "azurerm_container_registry" "acr" {
  name                = "chronokeysacr"
  resource_group_name = "chronokeys-rg"
}