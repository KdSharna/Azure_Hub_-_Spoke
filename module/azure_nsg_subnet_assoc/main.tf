
# resource "azurerm_subnet_network_security_group_association" "this" {
#   for_each = data.azurerm_subnet.subnets

#   subnet_id                 = each.value.id
#   network_security_group_id = var.nsg_ids[split("-", each.key)[0]] # NSG name part
# }