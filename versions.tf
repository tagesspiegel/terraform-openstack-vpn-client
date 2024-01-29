terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.54.0"
    }
  }
  required_version = "~> v1.6"
}
