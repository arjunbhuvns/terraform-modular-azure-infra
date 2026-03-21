resource "azurerm_network_security_group" "nsgs" {
    for_each = var.nsgs
  name                = each.value.name
  location            = var.rg_output[each.value.rg_key].location
  resource_group_name = var.rg_output[each.value.rg_key].name

  security_rule {
    name                       = each.value.security_rule.name
    priority                   = each.value.security_rule.priority
    direction                  = each.value.security_rule.direction
    access                     = each.value.security_rule.access
    protocol                   = each.value.security_rule.protocol
    source_port_range          = each.value.security_rule.source_port_range
    destination_port_range     = each.value.security_rule.destination_port_range
    source_address_prefix      = each.value.security_rule.source_address_prefix
    destination_address_prefix = each.value.security_rule.destination_address_prefix
  }

  tags = {
    environment = each.value.tags.environment
  }
}


resource "azurerm_subnet_network_security_group_association" "example" {
    for_each = var.nsgs
  subnet_id                 = var.subnet_output[each.value.subnet_key].id
  network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}
