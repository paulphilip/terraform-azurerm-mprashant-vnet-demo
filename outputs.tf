# Resource Group outputs
output "resource_group_name" {
  description = "Name of the created Resource Group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "ID of the created Resource Group"
  value       = azurerm_resource_group.this.id
}

# Virtual Network outputs
output "vnet_name" {
  description = "Name of the created Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "vnet_id" {
  description = "ID of the created Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_address_space" {
  description = "Address space configured for the Virtual Network"
  value       = azurerm_virtual_network.this.address_space
}

# Subnet outputs
output "subnet_name" {
  description = "Name of the created subnet"
  value       = azurerm_subnet.this.name
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = azurerm_subnet.this.id
}

output "subnet_address_prefixes" {
  description = "Address prefixes configured for the subnet"
  value       = azurerm_subnet.this.address_prefixes
}
