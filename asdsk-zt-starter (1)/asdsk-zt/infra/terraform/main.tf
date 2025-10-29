# Sprint 1 skeleton — resource group + placeholders
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# TODO:
# - azurerm_kubernetes_cluster (AKS) or Container Apps
# - azurerm_postgresql_flexible_server + private endpoint
# - user-assigned managed identity and role assignments
# - network: vnet/subnets/private dns zones
