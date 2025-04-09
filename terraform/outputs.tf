output "acr_login_server" {
  value = azurerm_container_registry.frontend_acr.login_server
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.frontend_aks.name
}

output "resource_group" {
  value = azurerm_resource_group.frontend_rg.name
}
