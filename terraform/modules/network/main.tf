# VNet/Subnet
resource "azurerm_virtual_network" "vnet" {
  name                = "chronokeys-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "uksouth"
  resource_group_name = "chronokeys-rg"
}

resource "azurerm_subnet" "aca" {
  name                 = "aca-subnet"
  resource_group_name  = "chronokeys-rg"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/23"]
}