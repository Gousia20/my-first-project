resource "azurerm_key_vault" "kv" {
name = "mykey"
resource_group_name = data.azurerm_resource_group.rg.name
location = data.azurerm_resource_group.rg.location
tenant_id = data.azurerm_client_congif.current.tenant.id
keyvault_protection_enabled = false
soft_delect_retention_days = 7
}

data "azurerm_client_config" "current" {}
