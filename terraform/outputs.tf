# Root Outputs
output "container_app_url" {
  value = module.container_app.container_app_fqdn
}

output "frontdoor_url" {
  value = module.frontdoor.frontdoor_url
}