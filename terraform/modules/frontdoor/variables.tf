variable "profile_name" {
  description = "The name of the Front Door profile"
  type        = string
}

variable "endpoint_name" {
  description = "The name of the Front Door endpoint"
  type        = string
}

variable "origin_group_name" {
  description = "The name of the origin group"
  type        = string
}

variable "origin_name" {
  description = "The name of the origin"
  type        = string
}

variable "origin_hostname" {
  description = "The hostname of the origin (usually the Container App FQDN)"
  type        = string
}

variable "route_name" {
  description = "The name of the Front Door route"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
