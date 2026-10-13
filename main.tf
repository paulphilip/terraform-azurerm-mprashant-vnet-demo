resource "azurerm_resource_group" "this" {
  name     = var.rg_config.name
  location = var.rg_config.location
}

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_config.name
  address_space       = var.vnet_config.address_space
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  name                 = var.subnet_config.name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.subnet_config.address_prefixes
}
