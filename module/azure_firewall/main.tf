resource "azurerm_firewall" "lb_firewall" {
  for_each = var.lb_firewall

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier
  

  ip_configuration {
    name                 = "fw-ipconfig"
    subnet_id            = data.azurerm_subnet.firewall_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.firewall_pip[each.key].id
  }
}


