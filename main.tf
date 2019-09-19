provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.33.1"
}

# Create a resource group
resource "azurerm_resource_group" "rg-dev" {
  name     = "rg-dev"
  location = "West US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "rg-dev" {
  name                = "dev-network"
  resource_group_name = "${azurerm_resource_group.rg-dev.name}"
  location            = "${azurerm_resource_group.rg-dev.location}"
  address_space       = ["10.0.0.0/16"]
}
