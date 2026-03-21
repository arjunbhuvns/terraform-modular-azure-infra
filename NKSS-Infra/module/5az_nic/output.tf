output "nic_output" {
  value = {
    for k, nics in azurerm_network_interface.nics :
    k => {
      name = nics.name
      id   = nics.id
    }
  }
}
