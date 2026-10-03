resource "azurerm_storage_account" "sa" {
name = "mysa"
resource_group_name = data.azurerm_resource_group.rg.name
location = data.azurerm_resource_group.rg.location
account_type = "standard"
account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
name = "container"
storage_account_id = azurerm_storage_account.sa.id
container_access_type = "private"
}
