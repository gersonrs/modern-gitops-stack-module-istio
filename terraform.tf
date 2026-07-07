terraform {
  required_providers {
    argocd = {
      source  = "argoproj-labs/argocd"
      version = ">= 7"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2"
    }
    utils = {
      source  = "cloudposse/utils"
      version = ">= 1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3"
    }
  }
}

provider "kubernetes" {
  host                   = var.cluster.host
  client_certificate     = var.cluster.client_certificate
  client_key             = var.cluster.client_key
  cluster_ca_certificate = var.cluster.cluster_ca_certificate
}
