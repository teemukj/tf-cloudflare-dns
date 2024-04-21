# Define required provider
terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

# Create records
resource "cloudflare_record" "record" {
  for_each = var.records

  name     = "${var.name_prefix}${try(each.value.name, var.cloudflare_zone_name)}"
  type     = each.value.type
  value    = each.value.value
  zone_id  = var.cloudflare_zone_id
  ttl      = try(each.value.ttl, 1)
  proxied  = try(each.value.proxied, false)
  priority = try(each.value.priority, null)
}
