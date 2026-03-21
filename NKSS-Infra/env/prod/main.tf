module "rg_call" {
  source = "../../module/1az_rg"
  rg     = var.rg
}



module "storage" {
  source     = "../../module/2az_stg"
  depends_on = [module.rg_call]

  stg       = var.stg
  rg_output = module.rg_call.rg_output

}


module "vnet" {
  source     = "../../module/3az_vnet"
  depends_on = [module.rg_call]

  vnet      = var.vnet
  rg_output = module.rg_call.rg_output
}

module "subnet" {
  source     = "../../module/4az_subnet"
  depends_on = [module.rg_call, module.vnet]

  subnets     = var.subnets
  rg_output   = module.rg_call.rg_output
  vnet_output = module.vnet.vnet_output
}

module "nic" {
  source     = "../../module/5az_nic"
  depends_on = [module.rg_call, module.subnet]

  nics          = var.nics
  rg_output     = module.rg_call.rg_output
  subnet_output = module.subnet.subnet_output

}

module "vms" {
  source     = "../../module/az_vm"
  depends_on = [module.rg_call, module.nic]

  vms        = var.vms
  rg_output  = module.rg_call.rg_output
  nic_output = module.nic.nic_output

}

module "public_ip" {
  source     = "../../module/6az_pubip"
  depends_on = [module.rg_call]

  public_ip = var.public_ip
  rg_output = module.rg_call.rg_output
}