# resource "azurerm_lb_probe" "lb_probe" {
#   for_each = var.lb_probe

#   name            = each.value.name
#   port            = each.value.port
#   loadbalancer_id = var.lb_id
# }
