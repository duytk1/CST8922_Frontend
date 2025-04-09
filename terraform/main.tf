provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "frontend_rg" {
  name     = "cst8922-frontend-rg"
  location = var.location
}

resource "azurerm_container_registry" "frontend_acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.frontend_rg.name
  location            = azurerm_resource_group.frontend_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "frontend_aks" {
  name                = "cst8922-frontend-aks"
  location            = azurerm_resource_group.frontend_rg.location
  resource_group_name = azurerm_resource_group.frontend_rg.name
  dns_prefix          = "cst8922-frontend"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_container_registry.frontend_acr]
}
