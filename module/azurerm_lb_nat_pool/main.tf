# resource "azurerm_lb_nat_pool" "nat_pool" {
#   for_each = var.nat_pool

#   name                           = each.value.name
#   protocol                       = each.value.protocol
#   frontend_port_start            = each.value.frontend_port_start
#   frontend_port_end              = each.value.frontend_port_end
#   backend_port                   = each.value.backend_port
#   frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
#   resource_group_name            = each.value.rg_name
#   loadbalancer_id                = var.lb_id
# }


