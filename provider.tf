terraform {
    backend "remote" {
        organization = "telliott-io"
        workspaces {
            name = "dns"
        }
    }

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.18.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.0.2"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
}

provider "cloudflare" {
  # Configuration options
  email = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "digitalocean" {
  token = var.do_token
}