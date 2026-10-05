resource "azurerm_keyvault" "kv" {
name = var.name
resource_group_name = var.resource_group_name
location = var.location
tenant_id = data.azurerm_client_config.current.tenant.id
purge_protection_enabled = false
soft_delete_retention_days = 7
sku = "standard"
 }

data "azurerm_client_config" "current" {}

