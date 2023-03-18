terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

resource "cloudflare_record" "record" {
  name     = var.name
  priority = var.priority
  proxied  = var.proxied
  ttl      = var.ttl
  type     = var.type
  value    = var.value
  zone_id  = var.zone_id
}
