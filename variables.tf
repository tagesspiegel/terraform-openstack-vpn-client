variable "vpn_name" {
  type        = string
  description = "Name of the VPN"
}

variable "ike_config" {
  type = object({
    version              = string
    auth_algorithm       = string
    encryption_algorithm = string
    pfs                  = string
  })
  description = "IKE configuration"
  default = {
    auth_algorithm       = "sha256"
    encryption_algorithm = "aes-256"
    pfs                  = "group14"
    version              = "v2"
  }
}

variable "ipsec_config" {
  type = object({
    auth_algorithm       = string
    encryption_algorithm = string
    pfs                  = string
  })
  description = "IPSec configuration"
  default = {
    auth_algorithm       = "sha256"
    encryption_algorithm = "aes-256"
    pfs                  = "group14"
  }
}

variable "router_id" {
  type        = string
  description = "Name of the router"
}

variable "subnet_id" {
  type        = string
  description = "Name of the network"
}

variable "peer_address" {
  type        = string
  description = "Address of the peer"
}

variable "peer_endpoint_cidrs" {
  type        = list(string)
  description = "CIDRs of the peer endpoints"
}

variable "vpn_config" {
  type = object({
    dpd = object({
      action   = string
      interval = number
      timeout  = number
    })
    mtu = number
  })
  description = "VPN Gateway configuration"
  default = {
    dpd = {
      action   = "hold"
      interval = 30
      timeout  = 120
    }
    mtu = 1500
  }
}

variable "psk" {
  type        = string
  description = "Pre-shared key"
  sensitive   = true
}

variable "admin_state_up" {
  type        = bool
  description = "Admin state of the VPN"
  default     = true
}

variable "vpn_service_id" {
  type        = string
  description = "ID of the VPN service"
}
