resource "azurerm_virtual_network" "vnet_res" {
  for_each = var.vnet

  name                = each.value.name
  location            = var.rg_output[each.value.rg_key].location
  resource_group_name = var.rg_output[each.value.rg_key].name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  tags = try(each.value.tags, {})
}