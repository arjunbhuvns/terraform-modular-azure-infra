resource "azurerm_subnet" "subnets" {
    for_each = var.subnets
  name                 = each.value.name
  resource_group_name  = var.rg_output[each.value.rg_key].name
  virtual_network_name = var.vnet_output[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes

}