resource "azurerm_kubernetes_cluster" "aks" {
name = var.name
resource_group_name = var.resource_group_name
location = var.location
dns_prefix = var.dns_prefix

default_node_pool {
name = var.agent_name
node_count = 1
vm_size = var.vm_size
}

identity {
type = SystemAssigned
}

