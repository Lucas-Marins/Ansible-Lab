resource "azurerm_application_insights" "insight" {
  name                = format("ins-%s-999", var.resource_group_name)
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  tags                = var.tags
}


resource "azurerm_log_analytics_workspace" "log" {
  name                = format("log-%s", var.resource_group_name)
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}