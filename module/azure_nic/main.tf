resource "azurerm_network_interface" "nic_name" {
  for_each = var.nic_name

  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
#  enable_ip_forwarding = lookup(each.value, "ip_forward", false)  # 👈 MAGIC

  ip_configuration {
    name = "internal"
    # public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"

    # public_ip_address_id = (
    #   each.value.pip_name != null ?
    #   data.azurerm_public_ip.pip[each.key].id
    #   :
    #   null
    # )
  }
}

