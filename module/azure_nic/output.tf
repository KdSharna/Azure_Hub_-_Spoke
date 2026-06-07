# output "subnet_id" {
#   value = data.azurerm_subnet.example.id
# }

# output "public_ip_address" {
#   value = data.azurerm_public_ip.example.ip_address
# }

output "nic_ids" {
  value = { for k, v in azurerm_network_interface.nic_name : k => v.id }
}

