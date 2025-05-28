# User-Assigned Identity
resource "azurerm_user_assigned_identity" "aca_identity" {
  name                = var.identity_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Grant ACR Pull
resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull" 
  principal_id         = azurerm_user_assigned_identity.aca_identity.principal_id
}