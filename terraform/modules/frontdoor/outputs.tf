output "frontdoor_url" {
  description = "The URL of the Azure Front Door endpoint"
  value       = "https://${azurerm_cdn_frontdoor_endpoint.fd_endpoint.host_name}"
}
