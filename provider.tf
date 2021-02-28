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
  }
}

provider "cloudflare" {
  # Configuration options
  email = var.cloudflare_email
  api_key = var.cloudflare_api_key
}