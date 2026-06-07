# data "azurerm_subnet" "subnets" {
#   for_each             = toset(["fe_subnet", "be_subnet"]) # subnets jahan apply karna hai
#   name                 = each.value
#   virtual_network_name = "vnet-onprem"
#   resource_group_name  = "onprem_nsg"
# }
