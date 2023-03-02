resource "azurerm_service_plan" "appserviceplan" {
  name                = "benevidesappsvcplan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v3"
}

resource "azurerm_linux_web_app" "example" {
  name                = "benevidescontactsapi"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

    site_config {
        application_stack {
            java_server = "JAVA"
            java_version = 17
            java_server_version = 17
        }
    }

    app_settings = {
      "PORT" = 8080
    }

}