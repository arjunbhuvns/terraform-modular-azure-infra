resource "azurerm_public_ip" "public_ip" {
  for_each = var.public_ip
  name                = each.value.name
  resource_group_name = var.rg_output[each.value.rg_key].name
  location            = var.rg_output[each.value.rg_key].location
  allocation_method   = "Static"

}