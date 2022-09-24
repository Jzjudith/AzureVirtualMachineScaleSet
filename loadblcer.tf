

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

resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "BkndAddPl"
}


resource "azurerm_lb_outbound_rule" "test" {
  loadbalancer_id         = azurerm_lb.example.id
  name                    = "outboundRule"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
  frontend_ip_configuration {
    name = "outboundip"
  }

}

resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "running-probe"
  port            = 80
}

resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.example.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "FrndPip"
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.example.id]
  probe_id = azurerm_lb_probe.example.id

}




