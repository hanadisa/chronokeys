variable "resource_group_name" {
  description = "The name of the resource group for the Front Door resources."
  type        = string
}

variable "profile_name" {
  description = "The name of the Azure Front Door Standard/Premium profile."
  type        = string
}

variable "endpoint_name" {
  description = "The name of the Azure Front Door endpoint."
  type        = string
}

variable "origin_group_name" {
  description = "The name of the Azure Front Door origin group."
  type        = string
}

variable "origin_name" {
  description = "The name of the Azure Front Door origin."
  type        = string
}

variable "origin_hostname" {
  description = "The hostname of the origin (e.g., Container App FQDN)."
  type        = string
}

variable "route_name" {
  description = "The name of the Azure Front Door route."
  type        = string
}