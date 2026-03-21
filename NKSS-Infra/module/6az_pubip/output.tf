output "public_ip_output" {
  value = {
    for k, pubip in azurerm_public_ip.public_ip :
    k => {
      id = pubip.id
    }
  }
}
