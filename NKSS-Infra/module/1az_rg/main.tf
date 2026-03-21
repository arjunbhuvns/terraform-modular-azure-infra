resource "azurerm_resource_group" "bhola" {
  for_each   = var.rg
  #Required Arguments
  name       = each.value.name
  location   = each.value.location
  
  #Optional Arguments
  managed_by = lookup(each.value, "managed_by", null) 
  tags = lookup(each.value, "tags", {                 
    environment = each.value.tags.environment
    owner       = each.value.tags.owner
  })
}