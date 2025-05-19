output "container_app_fqdn" {
  description = "The FQDN of the deployed Container App"
  value       = azurerm_container_app.chronokeys_app.ingress[0].fqdn
}
