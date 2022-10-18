# AzureVirtualMachineScaleSet
This configuration creates a virtual machine scale set and a loadbalancer with related resources.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_outbound_rule.test](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/lb_outbound_rule) | resource |
| [azurerm_lb_probe.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/lb_rule) | resource |
| [azurerm_linux_virtual_machine_scale_set.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_monitor_autoscale_setting.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip.example2](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.internal](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefixes of the subnet | `list` | <pre>[<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space of the vitual network | `list` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | The name of the load balancer | `string` | `"devvmsslb"` | no |
| <a name="input_loadbpip"></a> [loadbpip](#input\_loadbpip) | The ip address loadbalancer | `string` | `"loadbpip"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the resources would be created | `string` | `"East US2"` | no |
| <a name="input_outboundpip"></a> [outboundpip](#input\_outboundpip) | The outbound rule public ip address | `string` | `"outboundpip"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The nmae of the resource group | `string` | `"devlab-vmss-rg"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags attached to the resources | `map` | <pre>{<br>  "environment": "Development"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_prefixes"></a> [address\_prefixes](#output\_address\_prefixes) | The address prefixes of the subnet |
| <a name="output_address_space"></a> [address\_space](#output\_address\_space) | The address space of the vitual network |
| <a name="output_lb_name"></a> [lb\_name](#output\_lb\_name) | The name of the load balancer |
| <a name="output_loadbpip"></a> [loadbpip](#output\_loadbpip) | The ip address loadbalancer |
| <a name="output_loadbpip_id"></a> [loadbpip\_id](#output\_loadbpip\_id) | The Id of the load balancer public ip |
| <a name="output_location"></a> [location](#output\_location) | The location where the resources would be created |
| <a name="output_outboundpip"></a> [outboundpip](#output\_outboundpip) | The outbound rule public ip address |
| <a name="output_outboundpip_"></a> [outboundpip\_](#output\_outboundpip\_) | The Id of the load balancer outbound rule public ip |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The nmae of the resource group |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags attached to the resources |
<!-- END_TF_DOCS -->