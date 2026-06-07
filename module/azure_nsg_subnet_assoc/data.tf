# data "azurerm_subnet" "subnets" {
#   for_each = toset(flatten(values(var.nsg_subnet_associate)))

#   name                 = each.value
#   virtual_network_name = var.vnet_name
#   resource_group_name  = var.rg_name
# }

# locals {
#   subnet_map = merge([
#     for nsg, subs in var.nsg_subnet_associate : 
#     { for sub in subs : "${nsg}-${sub}" => sub }
#   ]...)
# }

# data "azurerm_subnet" "subnets" {
#   for_each = local.subnet_map

#   name                 = each.value
#   virtual_network_name = var.vnet_name
#   resource_group_name  = var.rg_name
# }