variable "nsgs" {
    type = map(object({
    name                = string
    rg_key             = string
    subnet_key         = string

  security_rule  = object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })

  tags = map(string)
    }))
}

variable "rg_output" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "subnet_output" {}