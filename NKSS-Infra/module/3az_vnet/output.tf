output "vnet_output" {
  value = {
    for k, vnet_res in azurerm_virtual_network.vnet_res :
    k => {
      name     = vnet_res.name
      location = vnet_res.location
      tags    = vnet_res.tags
      id      = vnet_res.id
    }
  }
}