# resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assoc" {
#   nat_gateway_id       = azurerm_nat_gateway.nat["nat1"].id
#   public_ip_address_id = azurerm_public_ip.pip["pip3"].id
# }


# resource "azurerm_subnet_nat_gateway_association" "fe_nat_assoc" {
#   subnet_id      = azurerm_subnet.subnet["fe_subnet"].id
#   nat_gateway_id = azurerm_nat_gateway.nat["nat1"].id
# }

# resource "azurerm_subnet_nat_gateway_association" "be_nat_assoc" {
#   subnet_id      = azurerm_subnet.subnet["be_subnet"].id
#   nat_gateway_id = azurerm_nat_gateway.nat["nat1"].id
# }
