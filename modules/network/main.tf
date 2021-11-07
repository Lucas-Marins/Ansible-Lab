resource "azurerm_virtual_network" "example" {
  name                = format("vn-%s", var.resource_group_name)
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space


  
  dynamic "subnet" {
    for_each = var.subnets
    content {
       name           = subnet.value.name
       address_prefix = subnet.value.address_prefix
    }
   
  }
  tags = var.tags
}