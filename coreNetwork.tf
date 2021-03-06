resource "azurerm_resource_group" "Core" {
  name     = "Citadel-Core"
  location = "${var.loc}"
  tags     = "${var.tags}"
}

resource "azurerm_public_ip" "vpnGatewayPublicIp" {
  name                         = "vpnGatewayPublicIP"
  location                     = "${azurerm_resource_group.Core.location}"
  resource_group_name          = "${azurerm_resource_group.Core.name}"
  public_ip_address_allocation = "dynamic"

  tags = "${azurerm_resource_group.Core.tags}"
}

resource "azurerm_virtual_network" "Core" {
  name                = "Core"
  resource_group_name = "${azurerm_resource_group.Core.name}"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.Core.location}"
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  /* subnet {
                    name           = "GatewaySubnet"
                    address_prefix = "10.0.0.0/24"
                  }

                  subnet {
                    name           = "training"
                    address_prefix = "10.0.1.0/24"
                  }

                  subnet {
                    name           = "dev"
                    address_prefix = "10.0.2.0/24"
                  }
                */
  tags = "${azurerm_resource_group.Core.tags}"
}

resource "azurerm_subnet" "GatewaySubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = "${azurerm_resource_group.Core.name}"
  virtual_network_name = "${azurerm_virtual_network.Core.name}"
  address_prefix       = "10.0.0.0/24"
}

resource "azurerm_subnet" "TrainingSubnet" {
  name                 = "training"
  resource_group_name  = "${azurerm_resource_group.Core.name}"
  virtual_network_name = "${azurerm_virtual_network.Core.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "DevSubnet" {
  name                 = "dev"
  resource_group_name  = "${azurerm_resource_group.Core.name}"
  virtual_network_name = "${azurerm_virtual_network.Core.name}"
  address_prefix       = "10.0.2.0/24"
}

/*
resource "azurerm_virtual_network_gateway" "vpnGateway" {
  name                = "vpGateway"
  resource_group_name = "${azurerm_resource_group.Core.name}"
  location            = "${azurerm_resource_group.Core.location}"

  type     = "vpn"
  vpn_type = "routebased"

  enable_bgp = true
  sku        = "Basic"

  ip_configuration {
    name                          = "vpnGwConfig1"
    public_ip_address_id          = "${azurerm_public_ip.vpnGatewayPublicIp.id}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${azurerm_subnet.GatewaySubnet.id}"
  }
}
*/

