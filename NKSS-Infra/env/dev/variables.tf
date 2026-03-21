variable "rg" {
  type = map(object({
    name     = string
    location = string

    managed_by = optional(string)

    tags = optional(map(string), {
      environment = "dev"
      owner       = "arjun"
      }
  ) }))
}

variable "stg" {
  type = map(object({
    name                     = string
    account_tier             = string
    account_replication_type = string
    rg_key                   = string
    tags = optional(map(string), {
      environment = "dev"
    })
  }))
}



variable "vnet" {
  type = map(object({

    #Required Variables
    name          = string
    rg_key        = string
    address_space = list(string)
    dns_servers   = list(string)

    tags = optional(map(string), {
      owner       = "Arjun"
      environment = "Dev"
  }) }))
}

variable "subnets" {
  type = map(object({
    name = string
    # resource_group_name  = string
    # virtual_network_name = string
    rg_key           = string
    vnet_key         = string
    address_prefixes = list(string)

  }))
}

variable "nics" {
  type = map(object({
    name       = string
    rg_key     = string
    subnet_key = string
    public_ip_key = string

    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
    })
    }
  ))
}

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
variable "vms" {
}

variable "public_ip" {}