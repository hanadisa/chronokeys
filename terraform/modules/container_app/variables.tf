variable "location" {
  description = "The Azure region for the Container App Environment."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for the Container App."
  type        = string
}

variable "subnet_id" {
  description = "The resource ID of the infrastructure subnet for the Container App Environment."
  type        = string
}

variable "environment_name" {
  description = "The name for the Azure Container App Environment."
  type        = string
}

variable "app_name" {
  description = "The name of the Azure Container App."
  type        = string
}

variable "container_name" {
  description = "The name of the container within the Container App."
  type        = string
}

variable "acr_login_server" {
  description = "The login server URL of the Azure Container Registry."
  type        = string
}

variable "container_image_tag" {
  description = "The Docker image tag to use for the container (e.g., 'v1.0.0' or 'latest')."
  type        = string
  default     = "latest"
}

variable "identity_id" {
  description = "The resource ID of the User Assigned Managed Identity."
  type        = string
}