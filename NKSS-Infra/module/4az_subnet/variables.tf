variable "subnets" {
  type = map(object({
    name = string
    # resource_group_name  = string
    rg_key = string
    # virtual_network_name = string
    vnet_key         = string
    address_prefixes = list(string)

  }))
}

variable "rg_output" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnet_output" {
  type = map(object({
    name     = string
    location = string
  }))
}
