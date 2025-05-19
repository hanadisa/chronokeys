variable "app_name" {
  description = "The name of the Container App"
  type        = string
}

variable "container_name" {
  description = "The name of the container inside the app"
  type        = string
}


variable "environment_name" {
  description = "The name of the Container App Environment"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to deploy the environment"
  type        = string
}

variable "acr_login_server" {
  description = "The login server of the ACR"
  type        = string
}

variable "identity_id" {
  description = "The ID of the user-assigned identity"
  type        = string
}
