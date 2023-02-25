resource "azurerm_api_management" "demo-apim" {
  name                = "demo-apim"
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = "Rafael Beneviodes"
  publisher_email     = "rbenevides@microsoft.com"

  sku_name = "Developer_1"
}