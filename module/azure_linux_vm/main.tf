
resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each = var.linux_vm

  name                = each.value.name
  computer_name       = each.value.computer_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.username[each.key].value
  admin_password      = data.azurerm_key_vault_secret.password[each.key].value
 disable_password_authentication = false
 
  custom_data = (
    each.value.script_name != null ?
    base64encode(file("${path.module}/${each.value.script_name}")) :
    null
  )

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      version   = source_image_reference.value.version
      sku       = source_image_reference.value.sku
      offer     = source_image_reference.value.offer
    }
  }

  
}
