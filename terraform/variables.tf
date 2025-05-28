# Global Config
variable "resource_group_name" {
  description = "Resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where all resources will be deployed."
  type        = string
  default     = "uksouth"
}

# Azure Container Registry (ACR) Config
variable "acr_name" {
  description = "The name of the ACR"
  type        = string
}

# Network Module Config
variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
  default     = "chronokeys-vnet"
}

variable "subnet_name" {
  description = "The name of the subnet within the Virtual Network."
  type        = string
  default     = "aca-subnet"
}

variable "vnet_address_space" {
  description = "A list of CIDR blocks for the Virtual Network's address space."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "A list of CIDR blocks for the subnet's address prefixes."
  type        = list(string)
  default     = ["10.0.0.0/23"]
}

# Identity Module Config
variable "identity_name" {
  description = "The name of the User Assigned Managed Identity."
  type        = string
  default     = "chronokeys-aca-identity"
}

# Container App Module Config
variable "aca_environment_name" {
  description = "The name of the Azure Container App Environment."
  type        = string
  default     = "chronokeys-env"
}

variable "aca_app_name" {
  description = "The name of the Azure Container App."
  type        = string
  default     = "chronokeys-app"
}

variable "container_image_name" {
  description = "The name of the container image within ACR (e.g., 'chronokeys')."
  type        = string
  default     = "chronokeys"
}

variable "container_image_tag" {
  description = "The Docker image tag to use for the container app (e.g., 'v1.0.0' or 'latest')."
  type        = string
  default     = "latest"
}

# Front Door Module Config
variable "frontdoor_profile_name" {
  description = "The name of the Azure Front Door Standard/Premium profile."
  type        = string
  default     = "chronokeys-fd-profile"
}

variable "frontdoor_endpoint_name" {
  description = "The name of the Azure Front Door endpoint."
  type        = string
}

variable "frontdoor_origin_group_name" {
  description = "The name of the Azure Front Door origin group."
  type        = string
  default     = "chronokeys-origin-group"
}

variable "frontdoor_origin_name" {
  description = "The name of the Azure Front Door origin."
  type        = string
  default     = "chronokeys-app-origin"
}

variable "frontdoor_route_name" {
  description = "The name of the Azure Front Door route."
  type        = string
  default     = "chronokeys-route"
}