# data "azurerm_lb" "loadbalancer_lb" {
# for_each = var.lb_rules
#   name                = each.value.name
#   resource_group_name = each.value.rg_name
# }