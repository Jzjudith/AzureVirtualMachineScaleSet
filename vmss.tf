# resource "tls_private_key" "ssh" {
#   algorithm = "RSA"
#   rsa_bits  = "4096"
# }

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = "example-vmss"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard_F2"
  instances           = 2
  custom_data          = filebase64("web.conf")
  admin_username      = "devlab"
  admin_password       =  "Password123"
  disable_password_authentication = false
#   encryption_at_host_enabled = true
#   admin_ssh_key {
#     username   = "devlab"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

 source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
     name                                   = "IPConfiguration"
     subnet_id                              = azurerm_subnet.internal.id
     load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.example.id]
     primary = true
   }
    }
  }

resource "azurerm_monitor_autoscale_setting" "example" {
  name                = "myAutoscaleSetting"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.example.id

  profile {
    name = "defaultProfile"

    capacity {
      default = 1
      minimum = 1
      maximum = 5
    } 
  }
}