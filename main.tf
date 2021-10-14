##################################################
# locals for tagging
##################################################

locals {
  common_tags = {
    Owner       = var.owner
    Environment = var.environment
    Cost_center = var.cost_center
    Application = var.app_name
  }
}

##################################################
# locals for App Gateway
##################################################

locals {

  gateway-ip-configuration       = "${var.environment}-${var.app_name}-gicname"
  backend_address_pool_name      = "${var.environment}-${var.app_name}-beapname"
  frontend_port_name             = "${var.environment}-${var.app_name}-fepname"
  frontend_ip_configuration_name = "${var.environment}-${var.app_name}-feipconfname"
  http_setting_name              = "${var.environment}-${var.app_name}-httpstname"
  listener_name                  = "${var.environment}-${var.app_name}-httplname"
  request_routing_rule_name      = "${var.environment}-${var.app_name}-rqrtname"
  redirect_configuration_name    = "${var.environment}-${var.app_name}-rdconfname"
}
##################################################
# Azure resource group
##################################################

resource "azurerm_resource_group" "rg" {
  name     = "${var.environment}-${var.app_name}-rg"
  location = var.location
  tags     = local.common_tags
}

##################################################
# Azure Vnet
##################################################
data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg_name
}

##################################################
# Azure Subnet
##################################################

data "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

##################################################
# Azure Net Profile
##################################################

resource "azurerm_network_profile" "netprofile" {
  name                = "${var.environment}-${var.app_name}-netprofile"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  container_network_interface {
    name = "${var.environment}-${var.app_name}-cni"

    ip_configuration {
      name      = var.ipconf_name
      subnet_id = azurerm_subnet.subnet.id
    }
  }
}

##################################################
# Azure PIP
##################################################

resource "azurerm_public_ip" "pip" {
  name                = "${var.environment}-${var.app_name}-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
}

##################################################
# Azure ACI
#################################################

resource "azurerm_container_group" "aci" {
  name                = "${var.environment}-${var.app_name}-aci"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  ip_address_type     = "private"
  network_profile_id  = azurerm_network_profile.netprofile.id
  dns_name_label      = var.dns_name_label
  os_type             = var.os_type

  container {
    name   = var.container_name
    image  = var.image_name
    cpu    = var.cpu_core_number
    memory = var.memory_size
    port   = var.port_number
  }
  tags = local.common_tags
}

##################################################
# Azure App Gateway
##################################################

resource "azurerm_application_gateway" "appgw" {
  name                = "${var.environment}-${var.app_name}-appgateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 1
  }

  gateway_ip_configuration {
    name      = local.gateway-ip-configuration
    subnet_id = azurerm_subnet.subnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}