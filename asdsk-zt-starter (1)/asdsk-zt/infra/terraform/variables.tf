variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
  default     = "rg-asdsk-zt"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "westeurope"
}
