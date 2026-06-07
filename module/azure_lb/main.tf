# resource "azurerm_lb" "main_lb" {
#   for_each            = var.main_lb
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name

#   dynamic "frontend_ip_configuration" {
#     for_each = each.value.frontend_ip_configuration
#     content {
#       name                 = frontend_ip_configuration.value.name
#       public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
#     }
#   }
# }

