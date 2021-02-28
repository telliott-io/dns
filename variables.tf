variable cloudflare_zone_id {}
#variable ingress_ip {}, replaced with data.kubernetes_service.ingress_nginx.status.0.load_balancer.0.ingress.0.ip
variable domain {}

variable cloudflare_email{}
variable cloudflare_api_key{}

variable do_token {}