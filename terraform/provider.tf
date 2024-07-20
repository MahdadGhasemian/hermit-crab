terraform {
  required_version = ">= 1.5.0"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
  }
}

# Kubernets Provider
provider "kubernetes" {
  config_path = "./k3s_kubeconfig.yaml"
}

# Helm Provider
provider "helm" {
  kubernetes {
    config_path = "./k3s_kubeconfig.yaml"
  }
}
