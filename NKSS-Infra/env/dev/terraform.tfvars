rg = {
  rg1 = {
    name     = "landingzone-rg"
    location = "canadacentral"

    managed_by = "developer"

    tags = {
      environment = "QA"
      owner       = "amol"
    }
  }

  # rg2 = {
  #   name     = "newrg008"
  #   location = "eastus"

  #   managed_by = "developer"

  #   tags = {
  #     environment = "QAC"
  #     owner       = "shivam"
  #   }
  # }
}

# tfstg = {
#   stg1 = {
#     name                     = "devstgforinfra"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#     rg_key                   = "rg1"
#     tags = {
#       environment = "dev"
#     }
#   }

stg = {
  stg1 = {
    name = "landingzonestorage007"
    # resource_group_name    = "amolrg"
    # location               = "east"
    rg_key                   = "rg1"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}


# stg2 = {
#   name                     = "meharbhaikastorage2"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   rg_key                   = "rg1"
#   tags = {
#     environment = "dev"
#   }
# }
# }


vnet = {
  vnet1 = {
    name          = "infratodovnet"
    rg_key        = "rg1"
    address_space = ["10.0.0.0/16"]
    dns_servers   = ["10.0.0.4"]

    tags = {
      owner       = "Arjun"
      environment = "Dev"
    }
  }
}

subnets = {
  frontendsub = {
    name             = "frontend_subnet"
    rg_key           = "rg1"
    vnet_key         = "vnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  backendsub = {
    name             = "backend_subnet"
    rg_key           = "rg1"
    vnet_key         = "vnet1"
    address_prefixes = ["10.0.2.0/24"]
  }
}

nics = {
  nic1 = {
    name       = "frontend-nic"
    rg_key     = "rg1"
    subnet_key = "frontendsub"
    public_ip_key = "pubip1"

    ip_configuration = {
      name                          = "frontend-ip"
      private_ip_address_allocation = "Dynamic"
    }
  }

  nic2 = {
    name       = "backend-nic"
    rg_key     = "rg1"
    subnet_key = "backendsub"
    public_ip_key = "pubip2"

    ip_configuration = {
      name                          = "backend-ip"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

public_ip = {
  pubip1 = {
    name              = "frontendpubip"
    rg_key            = "rg1"
    allocation_method = "Static"
  }

  pubip2 = {
    name              = "backendpubip"
    rg_key            = "rg1"
    allocation_method = "Static"
  }
}

nsgs = {
    nsg1 = {
    name                = "frontend-nsg"
    rg_key             = "rg1"
    subnet_key         = "frontendsub"

  security_rule  = {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Dev"
  }
    }

    nsg2 = {
    name                = "backend-nsg"
    rg_key             = "rg1"
    subnet_key         = "backendsub"

  security_rule  = {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Dev"
  }
    }
}


vms = {
  vm1 = {
    name    = "frontend-vm"
    rg_key  = "rg1"
    nic_key = "nic1"

    size           = "Standard_D2s_v3"
    admin_username = ""
    admin_password = ""
  }

  vm2 = {
    name    = "backend-vm"
    rg_key  = "rg1"
    nic_key = "nic2"

    size           = "Standard_D2s_v3"
    admin_username = ""
    admin_password = "!"
  }
}
