# ACR Module
module "acr" {
  source              = "./modules/acr"
  acr_name            = local.acr_name
  resource_group_name = local.resource_group_name
}

# Network Module
module "network" {
  source                  = "./modules/network"
  location                = local.location
  resource_group_name     = local.resource_group_name
  vnet_name               = "chronokeys-vnet"
  subnet_name             = "aca-subnet"
  vnet_address_space      = ["10.0.0.0/16"]
  subnet_address_prefixes = ["10.0.0.0/23"]
}

# Identity Module
module "identity" {
  source              = "./modules/identity"
  location            = local.location
  resource_group_name = local.resource_group_name
  identity_name       = "chronokeys-aca-identity"
  acr_id              = module.acr.acr_id
}

# Container App Module
module "container_app" {
  source              = "./modules/container_app"
  location            = local.location
  resource_group_name = local.resource_group_name
  environment_name    = "chronokeys-env"
  app_name            = "chronokeys-app"
  container_name      = "chronokeys"
  acr_login_server    = module.acr.acr_login_server
  identity_id         = module.identity.identity_id
  subnet_id           = module.network.subnet_id
}


# Front Door Module
module "frontdoor" {
  source              = "./modules/frontdoor"
  resource_group_name = local.resource_group_name
  profile_name        = "chronokeys-fd-profile"
  endpoint_name       = "chronokeys-fd-endpoint"
  origin_group_name   = "chronokeys-origin-group"
  origin_name         = "chronokeys-app-origin"
  origin_hostname     = module.container_app.container_app_fqdn
  route_name          = "chronokeys-route"
}