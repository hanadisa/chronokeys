# chronokeys-aca/terraform/modules/network/variables.tf

variable "location" {
  description = "The Azure region for the Virtual Network and Subnet."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for the Virtual Network and Subnet."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "vnet_address_space" {
  description = "A list of CIDR blocks for the Virtual Network's address space."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet within the Virtual Network."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "A list of CIDR blocks for the subnet's address prefixes."
  type        = list(string)
}