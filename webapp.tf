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
      "QUARKUS_MONGODB_CONNECTION_STRING" = "mongodb://benevidesmongodb:RCQj8FLv7fTt1ylIi65QUAgRLBb2EASk03HR9x2WtKgBNlKnI8HncU3QIBdeA0Zi5tD23GdrkTEAACDb1U3Tug==@benevidesmongodb.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@benevidesmongodb@"
      "PORT" = 8080
    }

}