# resource "azurerm_lb_rule" "lb_rules" {
#   for_each = var.lb_rules

#   name                           = each.value.name
#   protocol                       = each.value.protocol
#   frontend_port                  = each.value.frontend_port
#   backend_port                   = each.value.backend_port
#   frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
#   loadbalancer_id                = var.lb_id
# }


