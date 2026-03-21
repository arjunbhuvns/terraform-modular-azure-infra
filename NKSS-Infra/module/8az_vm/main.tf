
resource "azurerm_linux_virtual_machine" "vms" {
    for_each = var.vms
  name                = each.value.name
  resource_group_name = var.rg_output[each.value.rg_key].name
  location            = var.rg_output[each.value.rg_key].location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password # Note: In production, consider using more secure methods for handling sensitive data.
  disable_password_authentication = false
  network_interface_ids = [
    var.nic_output[each.value.nic_key].id,
  ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
