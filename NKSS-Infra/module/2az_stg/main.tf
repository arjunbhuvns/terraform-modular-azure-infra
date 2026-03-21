resource "azurerm_storage_account" "example" {
  for_each = var.stg
  name                     = each.value.name
  resource_group_name      = var.rg_output[each.value.rg_key].name
  location                 = var.rg_output[each.value.rg_key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  }





















# resource "azurerm_storage_account" "stg" {
#   for_each = var.tfstg

#   name                     = each.value.name
#   account_tier             = each.value.account_tier
#   account_replication_type = each.value.account_replication_type

#   resource_group_name = var.rg_output[each.value.rg_key].name
#   location            = var.rg_output[each.value.rg_key].location

#   tags = lookup(each.value, "tags", {})
# }


