# public ip
resource "azurerm_public_ip" "example" {
  name                = "loadbpip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_public_ip" "example2" {
  name                = "outboundip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

# subnet
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

# loadbalancer
resource "azurerm_lb" "example" {
  name                = "devlabtestLB"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  sku_tier            = "Regional"

  frontend_ip_configuration {
    name                 = "FrndPip"
    public_ip_address_id = azurerm_public_ip.example.id

  }

  frontend_ip_configuration {
    name                 = "outboundip"
    public_ip_address_id = azurerm_public_ip.example2.id

  }

}

# loasbalancer backend address pool
resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "BkndAddPl"
}

# loadbalancer outbound rule
resource "azurerm_lb_outbound_rule" "test" {
  loadbalancer_id         = azurerm_lb.example.id
  name                    = "outboundRule"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
  frontend_ip_configuration {
    name = "outboundip"
  }

}

# loadbalancer probe
resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "running-probe"
  port            = 80
}

# loadbalancer rule
resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.example.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "FrndPip"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.example.id]
  probe_id                       = azurerm_lb_probe.example.id

}




