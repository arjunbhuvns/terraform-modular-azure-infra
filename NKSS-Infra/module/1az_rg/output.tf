output "rg_output" {
  value = {
    for k, bhola in azurerm_resource_group.bhola :
    k => {
      name     = bhola.name
      location = bhola.location
      tags    = bhola.tags
      id      = bhola.id
    }
  }
}