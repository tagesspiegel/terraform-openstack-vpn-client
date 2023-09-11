# OpenStack VPN Client

This module creates and configures a VPN Client on OpenStack.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= v1.4.6 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 1.51.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 1.51.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [openstack_vpnaas_endpoint_group_v2.local](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/vpnaas_endpoint_group_v2) | resource |
| [openstack_vpnaas_endpoint_group_v2.peer](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/vpnaas_endpoint_group_v2) | resource |
| [openstack_vpnaas_ike_policy_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/vpnaas_ike_policy_v2) | resource |
| [openstack_vpnaas_ipsec_policy_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/vpnaas_ipsec_policy_v2) | resource |
| [openstack_vpnaas_service_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/vpnaas_service_v2) | resource |
| [openstack_vpnaas_site_connection_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/vpnaas_site_connection_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_state_up"></a> [admin\_state\_up](#input\_admin\_state\_up) | Admin state of the VPN | `bool` | `true` | no |
| <a name="input_ike_config"></a> [ike\_config](#input\_ike\_config) | IKE configuration | <pre>object({<br>    version              = string<br>    auth_algorithm       = string<br>    encryption_algorithm = string<br>    pfs                  = string<br>  })</pre> | <pre>{<br>  "auth_algorithm": "sha256",<br>  "encryption_algorithm": "aes-256",<br>  "pfs": "group14",<br>  "version": "v2"<br>}</pre> | no |
| <a name="input_ipsec_config"></a> [ipsec\_config](#input\_ipsec\_config) | IPSec configuration | <pre>object({<br>    auth_algorithm       = string<br>    encryption_algorithm = string<br>    pfs                  = string<br>  })</pre> | <pre>{<br>  "auth_algorithm": "sha256",<br>  "encryption_algorithm": "aes-256",<br>  "pfs": "group14"<br>}</pre> | no |
| <a name="input_peer_address"></a> [peer\_address](#input\_peer\_address) | Address of the peer | `string` | n/a | yes |
| <a name="input_peer_endpoint_cidrs"></a> [peer\_endpoint\_cidrs](#input\_peer\_endpoint\_cidrs) | CIDRs of the peer endpoints | `list(string)` | n/a | yes |
| <a name="input_psk"></a> [psk](#input\_psk) | Pre-shared key | `string` | n/a | yes |
| <a name="input_router_id"></a> [router\_id](#input\_router\_id) | Name of the router | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Name of the network | `string` | n/a | yes |
| <a name="input_vpn_config"></a> [vpn\_config](#input\_vpn\_config) | VPN Gateway configuration | <pre>object({<br>    dpd = object({<br>      action   = string<br>      interval = number<br>      timeout  = number<br>    })<br>    mtu = number<br>  })</pre> | <pre>{<br>  "dpd": {<br>    "action": "hold",<br>    "interval": 30,<br>    "timeout": 120<br>  },<br>  "mtu": 1500<br>}</pre> | no |
| <a name="input_vpn_name"></a> [vpn\_name](#input\_vpn\_name) | Name of the VPN | `string` | n/a | yes |
| <a name="input_vpn_service_id"></a> [vpn\_service\_id](#input\_vpn\_service\_id) | ID of the VPN service | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
