variable "location" {
  description = "The Azure region for the User-Assigned Identity."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for the User-Assigned Identity."
  type        = string
}

variable "identity_name" {
  description = "The name of the User-Assigned Managed Identity."
  type        = string
}

variable "acr_id" {
  description = "The resource ID of the Azure Container Registry for AcrPull role assignment."
  type        = string
}
