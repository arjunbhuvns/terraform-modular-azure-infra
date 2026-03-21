output "subnet_output" {
  value = {
    for k, subnets in azurerm_subnet.subnets :
    k => {
      name     = subnets.name
      id      = subnets.id
    }
  }
}