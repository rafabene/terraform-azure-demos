# Terraform scripts for Azure

This is a set of [Terraform](https://www.terraform.io/) files to create a test environment for Rafael Benevides

It uses version 3.45.0 of [azurerm provider](https://registry.terraform.io/providers/hashicorp/azurerm/3.5.0/docs) and at this moment the following resources will be created

- A resource group
- A Java Web App instance for the [Contacts REST API](https://github.com/rafabene/contacts-rest-api-mongodb) project
- A CosmosDB/MongoDB instance to store contacts
- A Spring Apps to deploy the [Spring SOAP API](https://github.com/rafabene/spring-soap-api) project
- A API Management to connect to use SOAP and REST APIs