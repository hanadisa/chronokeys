# User-Assigned Identity
resource "azurerm_user_assigned_identity" "aca_identity" {
  name                = "chronokeys-aca-identity"
  location            = "uksouth"
  resource_group_name = "chronokeys-rg"
}

# Grant ACR Pull
resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.aca_identity.principal_id
}