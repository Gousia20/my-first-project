module "vm" {
  source = "./modules/vm"

  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  username            = var.username
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  nic_name            = var.nic_name
  size                = var.vm_size
}


module "aks" {
  source = "./modules/aks"

  aks_name            = var.aks_name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.aks_vm_size
}


module "keyvault" {
  source = "./modules/keyvault"

  keyvault_name       = var.keyvault_name
  resource_group_name = var.resource_group_name
  location            = var.location
}


module "storage" {
  source = "./modules/storage"

  storage_name        = var.storage_name
  resource_group_name = var.resource_group_name
  location            = var.location
  container_name      = var.container_name
}
