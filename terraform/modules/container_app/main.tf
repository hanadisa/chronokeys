# Container App Env (public)
resource "azurerm_container_app_environment" "chronokeys_env" {
  name                         = var.environment_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  infrastructure_subnet_id     = var.subnet_id
  internal_load_balancer_enabled = false
}

# Container App
resource "azurerm_container_app" "chronokeys_app" {
  name                         = var.app_name
  container_app_environment_id = azurerm_container_app_environment.chronokeys_env.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type        = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  template {
    container {
      name  = var.container_name
      image = "${var.acr_login_server}/${var.container_name}:${var.container_image_tag}"
      cpu   = 0.25
      memory = "0.5Gi"
    }
  }

  registry {
    server   = var.acr_login_server
    identity = var.identity_id
  }

  ingress {
    external_enabled = true
    target_port      = 80
    transport        = "auto"

    traffic_weight {
      percentage    = 100
      latest_revision = true
    }
  }
}