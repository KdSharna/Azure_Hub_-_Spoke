# resource "azurerm_subnet_route_table_association" "assoc" {
#   for_each = var.subnet_rt_assoc

#   subnet_id      = each.value.subnet_id
#   route_table_id = each.value.route_table_id
# }
