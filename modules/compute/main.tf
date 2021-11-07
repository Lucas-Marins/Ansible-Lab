resource "azurerm_linux_virtual_machine" "example" {
  name                = format("vm-%s", var.resource_group_name)
  resource_group_name = var.location
  location            = var.resource_group_name
  address_space       = var.address_space

  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Password1234!" 
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}