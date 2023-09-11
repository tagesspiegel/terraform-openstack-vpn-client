// define network policies
resource "openstack_vpnaas_ike_policy_v2" "this" {
  name                 = var.vpn_name
  ike_version          = var.ike_config.version
  auth_algorithm       = var.ike_config.auth_algorithm
  encryption_algorithm = var.ike_config.encryption_algorithm
  pfs                  = var.ike_config.pfs
  description          = "Managed by Terraform"
}

resource "openstack_vpnaas_ipsec_policy_v2" "this" {
  name                 = var.vpn_name
  auth_algorithm       = var.ipsec_config.auth_algorithm
  encryption_algorithm = var.ipsec_config.encryption_algorithm
  pfs                  = var.ipsec_config.pfs
  description          = "Managed by Terraform"
}

// create vpn service
resource "openstack_vpnaas_service_v2" "this" {
  name           = var.vpn_name
  router_id      = var.router_id
  admin_state_up = "true"
  description    = "Managed by Terraform"
}

resource "openstack_vpnaas_endpoint_group_v2" "local" {
  name        = var.vpn_name
  description = "Managed by Terraform"
  type        = "subnet"
  endpoints   = [var.subnet_id]
  lifecycle {
    create_before_destroy = true
  }
}

resource "openstack_vpnaas_endpoint_group_v2" "peer" {
  name        = "${var.vpn_name}_peer"
  description = "Managed by Terraform"
  type        = "cidr"
  endpoints   = var.peer_endpoint_cidrs
  lifecycle {
    create_before_destroy = true
  }
}

resource "openstack_vpnaas_site_connection_v2" "this" {
  name        = var.vpn_name
  description = "Managed by Terraform"

  vpnservice_id  = var.vpn_service_id
  ikepolicy_id   = openstack_vpnaas_ike_policy_v2.this.id
  ipsecpolicy_id = openstack_vpnaas_ipsec_policy_v2.this.id
  // TODO(leon): replace with auto discovery based on OpenStack network
  local_ep_group_id = openstack_vpnaas_endpoint_group_v2.local.id

  peer_id          = var.peer_address
  peer_address     = var.peer_address
  psk              = var.psk
  peer_ep_group_id = openstack_vpnaas_endpoint_group_v2.peer.id

  admin_state_up = var.admin_state_up

  dpd {
    action   = var.vpn_config.dpd.action
    timeout  = var.vpn_config.dpd.timeout
    interval = var.vpn_config.dpd.interval
  }

  mtu = var.vpn_config.mtu
}
