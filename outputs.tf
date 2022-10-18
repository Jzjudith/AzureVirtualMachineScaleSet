output "resource_group_name" {
  description = "The nmae of the resource group"
  value       = azurerm_resource_group.example.name
}

output "location" {
  description = "The location where the resources would be created"
  value       = azurerm_resource_group.example.location
}

output "loadbpip" {
  description = "The ip address loadbalancer"
  value       = azurerm_public_ip.example.ip_address
}

output "loadbpip_id" {
  description = "The Id of the load balancer public ip"
  value       = azurerm_public_ip.example.id
}

output "outboundpip_" {
  description = "The Id of the load balancer outbound rule public ip"
  value       = azurerm_public_ip.example2.id
}
output "outboundpip" {
  description = "The outbound rule public ip address"
  value       = azurerm_public_ip.example2.ip_address
}

output "address_space" {
  description = "The address space of the vitual network"
  value       = azurerm_virtual_network.example.address_space
}

output "address_prefixes" {
  description = "The address prefixes of the subnet"
  value       = azurerm_subnet.internal.address_prefixes
}

output "lb_name" {
  description = "The name of the load balancer"
  value       = azurerm_lb.example.name
}

output "tags" {
  description = "The tags attached to the resources"
  value       = azurerm_resource_group.example.tags
}
