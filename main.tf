# name of the cloud provider
terraform {
    required_providers {
        hcloud = {
            source = "hetznercloud/hcloud"
            version = "1.24.1"
        }
    }
    backend "remote" {
        organization = "doublest"
        workspaces {
            name = "infra-jitsi"
        }
    }
}

# define the access token
variable "hcloud_token" {}

provider "hcloud" {
    token = var.hcloud_token
}

# create server for habor registry
resource "hcloud_server" "jitsi-server" {
  name        = "habor"
  server_type = "cx11"
  image       = "ubuntu-20.04"
  location    = "nbg1"
}
