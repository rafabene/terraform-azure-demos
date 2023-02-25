resource "azurerm_spring_cloud_service" "myspringapps" {
  name                = "myspringapps"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_spring_cloud_app" "countrywebservice" {
  name                = "countrywebservice"
  resource_group_name = var.resource_group_name
  service_name        = azurerm_spring_cloud_service.myspringapps.name

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_spring_cloud_java_deployment" "default" {
  name                = "default"
  spring_cloud_app_id = azurerm_spring_cloud_app.countrywebservice.id
  instance_count      = 2
  jvm_options         = "-XX:+PrintGC"

  quota {
    cpu    = "2"
    memory = "4Gi"
  }

  runtime_version = "Java_17"

}

resource "azurerm_spring_cloud_active_deployment" "example" {
  spring_cloud_app_id = azurerm_spring_cloud_app.countrywebservice.id
  deployment_name     = azurerm_spring_cloud_java_deployment.default.name
}