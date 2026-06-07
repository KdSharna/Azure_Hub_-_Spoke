# resource "azurerm_lb_backend_address_pool" "back_pool" {
#   for_each = var.back_pool

#   name            = each.value.name
#   loadbalancer_id = var.lb_id
# }

