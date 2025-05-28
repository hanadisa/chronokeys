# ACR Module
module "acr" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
}

# Network Module
module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name                   
  subnet_name         = var.subnet_name                 
  vnet_address_space  = var.vnet_address_space          
  subnet_address_prefixes = var.subnet_address_prefixes 
}

# Identity Module
module "identity" {
  source              = "./modules/identity"
  location            = var.location
  resource_group_name = var.resource_group_name
  identity_name       = var.identity_name               
  acr_id              = module.acr.acr_id
}

# Container App Module
module "container_app" {
  source              = "./modules/container_app"
  location            = var.location
  resource_group_name = var.resource_group_name
  environment_name    = var.aca_environment_name        
  app_name            = var.aca_app_name                
  container_name      = var.container_image_name        
  acr_login_server    = module.acr.acr_login_server
  identity_id         = module.identity.identity_id
  subnet_id           = module.network.subnet_id
}


# Front Door Module
module "frontdoor" {
  source              = "./modules/frontdoor"
  resource_group_name = var.resource_group_name
  profile_name        = var.frontdoor_profile_name      
  endpoint_name       = var.frontdoor_endpoint_name     
  origin_group_name   = var.frontdoor_origin_group_name 
  origin_name         = var.frontdoor_origin_name       
  origin_hostname     = module.container_app.container_app_fqdn
  route_name          = var.frontdoor_route_name        
}