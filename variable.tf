variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}


# VM

variable "vm_name" {
  type = string
}

variable "username" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "vm_size" {
  type = string
}


# AKS

variable "aks_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "node_count" {
  type = number
}

variable "aks_vm_size" {
  type = string
}


# Key Vault

variable "keyvault_name" {
  type = string
}


# Storage

variable "storage_name" {
  type = string
}

variable "container_name" {
  type = string
}
