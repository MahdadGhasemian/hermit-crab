terraform {
  required_version = ">= 1.5.0"

  required_providers {
    vagrant = {
      source  = "bmatcuk/vagrant"
      version = "~> 4.0.0"
    }
  }
}

provider "vagrant" {
  # no config
}

