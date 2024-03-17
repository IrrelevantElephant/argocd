terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.0"
    }
    ns1 = {
      source = "ns1-terraform/ns1"
    }
  }
}

provider "scaleway" {
  organization_id = local.organization_id
  region          = "fr-par"
  zone            = "fr-par-1"
}

data "scaleway_account_project" "project" {
  name = "default"
}

resource "scaleway_vpc_private_network" "private_network" {
  name       = "pvn-${local.project_name}"
  project_id = data.scaleway_account_project.project.id
}

resource "scaleway_registry_namespace" "main" {
  name        = "cr-${local.project_name}"
  description = "Container registry for ${local.project_name} project"
  is_public   = false
}