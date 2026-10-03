resource "azurerm_resource_group" "rg" {
name = "myrg"
location = "EAST US"
}

resource "azurerm_virtual_network" "vnet' {
name = "vnet"
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location
address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
name = "subnet1"
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefix = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "nic" {
name = "mynic"
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location

ip_configuration {
name = "internal"
subnet_id = azurerm_subnet.subnet.id
private_ip_allocation = "Dynamic"
} 
 }

resource "azurerm_linux_virtual_machine" "vm" {
name = "vm"
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location
admin_username = "azureuser"
size = "Standard_B1s"

network_interface_ids = [ azurerm_network_interface.nic.id ]

os_disk {
caching = "ReadWrite"
storage_account_type = "Standard_LRS"
}

admin_ssh_key {
username = "azureuser"
public_key = file("~/.ssh/id_rsa.pub")
}

source_image_referance {
publisher = "canoncial"
offer = "0001-com-ubuntu-server-jammy"
sku = "22_04-lts"
version = "Latest"
}
 }
