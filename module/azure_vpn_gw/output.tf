# output "vpn_gateway_id" {
#   value = azurerm_virtual_network_gateway.hub_vpn[*].id
# }

output "vpn_gateway_ids" {
  value = values(azurerm_virtual_network_gateway.hub_vpn)[*].id
}
