module "cluster" {
  source   = "github.com/telliott-io/kube-clusters//digitalocean/data?ref=v0.7.0"
  cluster_name = "prod-do-c"
}

provider "kubernetes" {
    config_path = lookup(jsondecode(local.kubernetes), "config_path", null)
    host     = lookup(jsondecode(local.kubernetes), "host", null)
    username = lookup(jsondecode(local.kubernetes), "username", null)
    password = lookup(jsondecode(local.kubernetes), "password", null)
    cluster_ca_certificate = lookup(jsondecode(local.kubernetes), "cluster_ca_certificate", null)
    token = lookup(jsondecode(local.kubernetes), "token", null)
    client_certificate = lookup(jsondecode(local.kubernetes), "client_certificate", null)
    client_key = lookup(jsondecode(local.kubernetes), "client_key", null)
}

data "kubernetes_service" "ingress_nginx" {
  metadata {
    name      = "ingress-nginx"
    namespace = "ingress-nginx"
  }
}

locals {
    kubernetes = jsonencode(module.cluster.kubernetes)
    ingress_ip = data.kubernetes_service.ingress_nginx.status.0.load_balancer.0.ingress.0.ip
}