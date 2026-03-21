resource "azurerm_network_interface" "nics" {

    for_each = var.nics
  name                = each.value.name
  location            = var.rg_output[each.value.rg_key].location
  resource_group_name = var.rg_output[each.value.rg_key].name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = var.subnet_output[each.value.subnet_key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    
    # 🔥 IMPORTANT LINE (missing in your code)
    public_ip_address_id = var.public_ip_output.public_ip_output[each.value.public_ip_key].id
}
}